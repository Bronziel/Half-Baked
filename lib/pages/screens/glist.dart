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
  XFile? _image;

  // Function to pick image
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });

    // Upload image to Firebase Storage
    try {
      Uint8List data = await _image!.readAsBytes();
      final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg', // Set content type explicitly as image/jpeg
      );
      await firebase_storage.FirebaseStorage.instance
          .ref('uploads/${Path.basename(_image!.path)}')
          .putData(data, metadata);

      print('Image uploaded to Firebase Storage successfully');
    } catch (e) {
      print('Image upload failed with error: $e');
    }
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
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: kIsWeb
                    ? Image.network(_image!.path)
                    : Image.file(File(_image!.path)),
              ),
          ],
        ),
      ),
    );
  }
}
