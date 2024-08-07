import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:carousel_slider/carousel_slider.dart';

class GlistPage extends StatefulWidget {
  // Use super parameter for 'key'
  const GlistPage({super.key});

  @override
  GlistPageState createState() => GlistPageState();
}

class GlistPageState extends State<GlistPage> {
  List<XFile> _images = [];
  bool _displayImages = false;
  List<String> _firebaseStoragePaths = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();

    setState(() {
      _images = images ?? [];
      _displayImages = false;
      _firebaseStoragePaths = [];
    });
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

      return downloadURL;
    } catch (e) {
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

  void _showImageDialog(String imagePath) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: Stack(
              children: <Widget>[
                Image.network(imagePath),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Page'),
      ),
      body: Center(
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
              SizedBox(
                height: 150, // adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
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
              Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: _firebaseStoragePaths.length,
                    itemBuilder: (context, index, realIdx) {
                      return GestureDetector(
                        onTap: () =>
                            _showImageDialog(_firebaseStoragePaths[index]),
                        child: Image.network(_firebaseStoragePaths[index]),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        _firebaseStoragePaths.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _current == entry.key
                                  ? Colors.purple
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: Image.network(entry.value, fit: BoxFit.cover),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
