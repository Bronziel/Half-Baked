import 'package:flutter/material.dart';
import '../../../../components/spacing/sizedboxes.dart';
import '../../../../components/currents/imgholders/sharingimgholder.dart';

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
