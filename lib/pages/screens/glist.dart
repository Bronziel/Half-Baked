import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class GlistPage extends StatefulWidget {
  @override
  _GlistPageState createState() => _GlistPageState();
}

class _GlistPageState extends State<GlistPage> {
  List<XFile> _images = [];
  bool _displayImages = false;
  List<String> _firebaseStoragePaths = [];

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    setState(() {
      _images = images ?? [];
      _displayImages = false;
      _firebaseStoragePaths = [];
    });
  }

  Future<void> _displayAndUploadImages() async {
    for (XFile image in _images) {
      String firebasePath = await _uploadImageToFirebase(image);
      _firebaseStoragePaths.add(firebasePath);
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

      print('Image uploaded to Firebase Storage successfully');
      return firebasePath;
    } catch (e) {
      print('Image upload failed with error: $e');
      return '';
    }
  }

  Future<void> _discardImages() async {
    if (_displayImages) {
      for (String path in _firebaseStoragePaths) {
        await firebase_storage.FirebaseStorage.instance.ref(path).delete();
      }
    }

    setState(() {
      _images = [];
      _displayImages = false;
      _firebaseStoragePaths = [];
    });
  }

  void _showImageDialog(String imagePath) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Stack(
              children: <Widget>[
                kIsWeb ? Image.network(imagePath) : Image.file(File(imagePath)),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
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
        title: Text('Empty Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is an empty page.',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: _pickImages,
              child: Text('Select Images'),
            ),
            ElevatedButton(
              onPressed: _displayAndUploadImages,
              child: Text('Display'),
            ),
            ElevatedButton(
              onPressed: _discardImages,
              child: Text('Discard'),
            ),
            if (!_displayImages)
              Row(
                children: _images
                    .map((image) => GestureDetector(
                          onTap: () => _showImageDialog(image.path),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: kIsWeb
                                ? Image.network(image.path, width: 100.0)
                                : Image.file(File(image.path), width: 100.0),
                          ),
                        ))
                    .toList(),
              ),
            if (_displayImages)
              Expanded(
                child: ListView.builder(
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: kIsWeb
                            ? Image.network(_images[index].path)
                            : Image.file(File(_images[index].path)),
                      );
                    }),
              ),
          ],
        ),
      ),
    );
  }
}
