import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

//1:image pikcer
class ImagePickerRedone extends StatefulWidget {
  const ImagePickerRedone({super.key});

  @override
  State<ImagePickerRedone> createState() => _ImagePickerRedoneState();
}

class _ImagePickerRedoneState extends State<ImagePickerRedone> {
  File? _image;

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 800,
        height: 800,
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
                : Image.file(_image!),
          ],
        ));
  }
}

//2:image pricker do 1 first