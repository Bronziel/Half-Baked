//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'create_image_boxes.dart';
import 'package:image_picker/image_picker.dart';

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
      onPressed: () async {
        await pickImages();
      },
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
            : /*Row(
              children: [
                CreateCarousell(
                  deleteImage: deleteImage,
                  onImagesSelected: addImages,
                  images: images,
                )
              ],
            ),*/
            TestOfImageslist(
                images: images,
              ));
  }
}

class TestOfImages extends StatelessWidget {
  final XFile images;

  const TestOfImages({
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 1000,
      ),
      child: Image.network(images!.path),
    ));
  }
}

class TestOfImageslist extends StatelessWidget {
  final List<XFile> images;

  const TestOfImageslist({
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 1000,
      ),
      child: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: images.map((file) {
              return Image.network(
                file.path,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              );
            }).toList(),
          )
        ],
      ),
    ));
  }
}
/*
    List<Future<Uint8List>> futureBytesList = pickedFiles.map(readFileBytes).toList();
    List<Uint8List> imageByteList = await Future.wait(futureBytesList);
    List<Future<Uint8List>> futureBytesList = pickedFiles.map((file) => file.readAsBytes()).toList();
*/