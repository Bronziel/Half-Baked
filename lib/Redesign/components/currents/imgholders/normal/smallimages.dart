import 'package:flutter/material.dart';
import '../../../styles/spacing/sizedboxes.dart';
import '../sharingimgholder.dart';

class Smallboxesholder extends StatelessWidget {
  const Smallboxesholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SmallImgBox(imagePath: 'images/new/kebabrulle.jpg'),
        Height40StandardWidget(),
        SmallImgBox(imagePath: 'images/new/kebab1.jpeg'),
        Height40StandardWidget(),
        SmallImgBox(imagePath: 'images/new/kebab3.jpg'),
        Height40StandardWidget(),
        SmallImgBox(imagePath: 'images/new/kebabrulle.jpg'),
      ],
    );
  }
}

class SmallImgBox extends StatelessWidget {
  final String imagePath;

  const SmallImgBox({
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

class BigImageBoxes extends StatelessWidget {
  final String imagePath;
  final double aspectratio;
  const BigImageBoxes(
      {required this.aspectratio, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: smallimgheight,
      width: smallimgwidth,
      child: Card(
        shape:
            smallImageShape(), // Assuming this is a function returning a ShapeBorder
        child: SecondBigImage(
          imagePath: imagePath,
          aspecRatio: aspectratio,
        ),
      ),
    );
  }
}

class ClipmyImages {
  static ClipRRect myIMages(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: child,
    );
  }
}

class SecondBigImage extends StatelessWidget {
  final String imagePath;
  final double aspecRatio;
  const SecondBigImage({
    required this.aspecRatio,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspecRatio,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
