import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart'; // For detecting platform

//1:image pikcer
class ImagePickerRedone extends StatefulWidget {
  const ImagePickerRedone({super.key});

  @override
  State<ImagePickerRedone> createState() => _ImagePickerRedoneState();
}

class _ImagePickerRedoneState extends State<ImagePickerRedone> {
  XFile? _image; // Changed to XFile to accommodate both web and mobile
  List<XFile> images = [];

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        // An image was picked, handle accordingly
        _image = pickedFile; // Direct assignment, works for both web and mobile
      } else {
        // No image was picked. This could be an intentional cancel or an error.
        print('No image selected or an error occurred.');
        // Optionally, you could set _image to null to reflect this state in your UI
        _image = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        width: 800,
        height: 300,
        child: Row(
          children: [
            _image == null
                ? Column(
                    children: [
                      IconButton(
                        onPressed: getImage,
                        icon: const Icon(Icons.add, size: 24),
                        color: const Color.fromARGB(255, 12, 11, 11),
                      ),
                      const Text('No image'),
                    ],
                  )
                : kIsWeb
                    ? Image.network(_image!.path) // For web, use Image.network
                    : Image.file(
                        File(_image!.path)), // For mobile, use Image.file
          ],
        ));
  }
}

//2:image pricker do 1 first

class ImagePickerManagement extends StatefulWidget {
  const ImagePickerManagement({super.key});

  @override
  State<ImagePickerManagement> createState() => _ImagePickerManagementState();
}

class _ImagePickerManagementState extends State<ImagePickerManagement> {
  //list to send to children with images
  List<XFile> images = [];
  //function to add images
  void addImages(List<XFile> newImages) {
    setState(() {
      images.addAll(newImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ImagePickerCarusell extends StatefulWidget {
  const ImagePickerCarusell({super.key});

  @override
  State<ImagePickerCarusell> createState() => _ImagePickerCarusellState();
}

class _ImagePickerCarusellState extends State<ImagePickerCarusell> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
