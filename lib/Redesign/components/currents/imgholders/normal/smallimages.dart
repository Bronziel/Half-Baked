import 'package:flutter/material.dart';
import '../../../styles/spacing/sizedboxes.dart';
import '../sharingimgholder.dart';

class PreviewBoxholder extends StatelessWidget {
  const PreviewBoxholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Previewbox(imagePath: 'images/new/kebabrulle.jpg'),
        Height40StandardWidget(),
        Previewbox(imagePath: 'images/new/kebab1.jpeg'),
        Height40StandardWidget(),
        Previewbox(imagePath: 'images/new/kebab3.jpg'),
        Height40StandardWidget(),
        Previewbox(imagePath: 'images/new/kebabrulle.jpg'),
      ],
    );
  }
}

class Previewbox extends StatelessWidget {
  final String imagePath;

  const Previewbox({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: smallimgheight,
      width: smallimgwidth,
      child: Card(
        shape:
            smallImageShape(), // Assuming this is a function returning a ShapeBorder
        child: ClipImg(imagePath: imagePath),
      ),
    );
  }
}

class ClipImg extends StatelessWidget {
  final String imagePath; // Add an imagePath property

  const ClipImg({
    super.key,
    required this.imagePath, // Make imagePath required
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderradius(), // Same radius as Card
      child: Image.asset(
        imagePath, // Use the imagePath property
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    );
  }
}
