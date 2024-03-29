import 'package:flutter/material.dart';
import 'create_image_boxes.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart'; // For detecting platform
import 'c_carosell.dart';

class ImagePickerUseable extends StatelessWidget {
  final Function(List<XFile>) onImagesSelected;
  const ImagePickerUseable({
    required this.onImagesSelected,
    super.key,
  });
  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      onImagesSelected(pickedFiles);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pickImages,
      child: const Text('Pick Images'),
    );
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

  void deleteImage(int index) {
    setState(() {
      if (index >= 0 && index < images.length) {
        images.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: images.isEmpty
          ? Createbigimg(
              needed: ImagePickerUseable(
                onImagesSelected: addImages,
              ),
            )
          : Row(
              children: [
                CreateCarousell(
                  deleteImage: deleteImage,
                  onImagesSelected: addImages,
                  images: images,
                )
              ],
            ),
    );
  }
}
