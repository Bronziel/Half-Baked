import 'package:flutter/material.dart';
import '../../../../components/sizedboxes.dart';

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
      height: 70,
      width: 70,
      child: Card(
        shape:
            smallImageShape(), // Assuming this is a function returning a ShapeBorder
        child: ClipsmallImg(imagePath: imagePath),
      ),
    );
  }
}

class ClipsmallImg extends StatelessWidget {
  final String imagePath; // Add an imagePath property

  const ClipsmallImg({
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

BorderRadius borderradius() => BorderRadius.circular(10);
RoundedRectangleBorder smallImageShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), // Define the border radius here
  );
}
