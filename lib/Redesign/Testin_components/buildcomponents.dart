import 'package:fb2/Redesign/Testin_components/showcase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/ComponentsRedesign.dart';
import '../components/imagesclass.dart';
import 'doneshowcase.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class BuildComponentPage extends StatelessWidget {
  const BuildComponentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          flexibleSpace: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 400, // Adjust the position as needed
                  child: SvgPicture.asset(
                    'images/bestickvit.svg',
                    width: 62, // Set the width of the SVG
                    height: 54.63, // Set the height of the SVG
                  ),
                ),
                const Text(
                  'HalfBaked',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Color(0xFFFFFFff)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ShowcaseButton(),
              ),
              SelectImage(),
              SizedBox(
                height: 400,
                width: 1085,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Define the border radius here
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Same radius as Card
                    child: Image.asset(
                      'images/new/kebabrulle.jpg',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  // Add other properties of Card if needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 1085,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _selectedImage == null
                  ? Image.asset(
                      'images/new/kebabrulle.jpg',
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    ),
            ),
            FloatingActionButton(
              onPressed: pickImage,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      cropImage(image.path);
    }
  }

  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        WebUiSettings(
          context: context,
          // Add other necessary configurations here
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _selectedImage = File(croppedFile.path);
      });
    }
  }
}
