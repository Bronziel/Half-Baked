import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:carousel_slider/carousel_slider.dart';
//testing flutter cropper
import 'package:image_cropper/image_cropper.dart';

class RedonePage extends StatefulWidget {
  const RedonePage({super.key});
  @override
  State<RedonePage> createState() => _RedonePageState();
}

class _RedonePageState extends State<RedonePage> {
  List<XFile> _images = [];
  bool _displayImages = false;
  List<String> _firebaseStoragePaths = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      for (var image in images) {
        CroppedFile? croppedFile = await _cropImage(image.path);
        if (croppedFile != null) {
          // Add cropped image to _images list
          _images.add(XFile(croppedFile.path));
        }
      }
    }

    setState(() {
      _displayImages = false;
      _firebaseStoragePaths = [];
    });
  }

//cropper
  Future<CroppedFile?> _cropImage(String path) async {
    // Calculate the aspect ratio
    const double targetAspectRatio = 1085 / 400;

    return await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1085, ratioY: 400),
      compressQuality: 100,
      uiSettings: [
        WebUiSettings(
          context: context,
        ),
      ],
    );
  }

  Future<void> _displayAndUploadImages() async {
    for (XFile image in _images) {
      String firebaseUrl = await _uploadImageToFirebase(image);
      _firebaseStoragePaths.add(firebaseUrl);
    }

    setState(() {
      _displayImages = true;
    });
  }

  Future<String> _uploadImageToFirebase(XFile image) async {
    try {
      Uint8List data = await image.readAsBytes();
      final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
      );
      String firebasePath = 'uploads/${Path.basename(image.path)}';
      await firebase_storage.FirebaseStorage.instance
          .ref(firebasePath)
          .putData(data, metadata);

      // Fetch the download URL of the uploaded image
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref(firebasePath)
          .getDownloadURL();

      print('Image uploaded to Firebase Storage successfully');
      return downloadURL;
    } catch (e) {
      print('Image upload failed with error: $e');
      return '';
    }
  }

  Future<void> _discardImages() async {
    if (_displayImages) {
      for (String url in _firebaseStoragePaths) {
        await firebase_storage.FirebaseStorage.instance
            .refFromURL(url)
            .delete();
      }
    }

    setState(() {
      _images = [];
      _displayImages = false;
      _firebaseStoragePaths = [];
    });
  }

  void _discardSingleImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

//dialog when pressing images
  void _showImageDialog(String imagePath) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //dialog when pressing images
          return AlertDialogForBigimage(
            imagePath: imagePath,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This is an empty page.',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text('Select Images'),
              ),
              ElevatedButton(
                onPressed: _displayAndUploadImages,
                child: const Text('Display'),
              ),
              if (_displayImages)
                ElevatedButton(
                  onPressed: _discardImages,
                  child: const Text('Discard'),
                ),
              if (!_displayImages)
                //rowbox where the display small preview
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 5, 239, 133),
                      width: 1,
                    ),
                  ),
                  height: 150, // adjust as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      //small preview boxes before display
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 211, 12, 12),
                            width: 1,
                          ),
                        ),
                        width: 120, // adjust as needed
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    _showImageDialog(_images[index].path),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: kIsWeb
                                      ? Image.network(_images[index].path,
                                          width: 100.0)
                                      : Image.file(File(_images[index].path),
                                          width: 100.0),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => _discardSingleImage(index),
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              if (_displayImages)
                //continaer with carousell
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff234234),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      //carousel ui
                      Container(
                        width: 1085,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 71, 13, 219),
                            width: 2,
                          ),
                        ),
                        child: CarouselSlider.builder(
                          itemCount: _firebaseStoragePaths.length,
                          itemBuilder: (context, index, realIdx) {
                            //gesture dector only bc for the on press show full image.
                            return GestureDetector(
                              //shows the image in a large version
                              onTap: () => _showImageDialog(
                                  _firebaseStoragePaths[index]),
                              child: SizedBox(
                                width: 1085,
                                height: 400,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Define the border radius here
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      _firebaseStoragePaths[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 400,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          carouselController: _controller,
                        ),
                      ),
                      //small boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            _firebaseStoragePaths.asMap().entries.map((entry) {
                          bool isCurrent = _current == entry.key;
                          //for selecting small box when pressed go to that ones
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              margin: const EdgeInsets.all(
                                  4.0), // Space between cards
                              decoration: isCurrent
                                  ? BoxDecoration(
                                      border: Border.all(
                                          color: Colors.purple, width: 2.0),
                                      borderRadius: BorderRadius.circular(
                                          12), // Slightly larger than the card's border radius
                                    )
                                  : null,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Border radius of the card
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Same radius as Card
                                  child: Image.network(
                                    entry.value,
                                    fit: BoxFit
                                        .cover, // Adjust the fit as needed
                                  ),
                                ),
                                elevation: isCurrent
                                    ? 5
                                    : 0, // Elevated if it's the current item
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

//alert dialog showing the big image in carousel whne pressed on
class AlertDialogForBigimage extends StatelessWidget {
  final String imagePath;
  const AlertDialogForBigimage({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: <Widget>[
          Container(
            width: 1085,
            height: 400,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imagePath)),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
