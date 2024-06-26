import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:cross_file/cross_file.dart';

class ImageCropperWidget extends StatefulWidget {
  final XFile image;
  final Function(XFile) onImageCropped;

  const ImageCropperWidget({
    super.key,
    required this.image,
    required this.onImageCropped,
  });

  @override
  State<ImageCropperWidget> createState() => _ImageCropperWidgetState();
}

class _ImageCropperWidgetState extends State<ImageCropperWidget> {
  Future<void> cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: widget.image.path,

      /*
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      )*/
    );

    if (croppedFile != null) {
      widget.onImageCropped(XFile(croppedFile.path));
    }
  }

  @override
  void initState() {
    super.initState();
    cropImage();
  }

  @override
  Widget build(BuildContext context) {
    // This widget's main task is to initiate cropping and handle the result.
    // The UI part is minimal, as the cropping UI is handled by the image_cropper plugin.
    return Container(); // You might not need to return anything visible, as the cropper has its own UI.
  }
}
