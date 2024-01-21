import 'package:flutter/material.dart';

import '../../../../components/sizedboxes.dart';

class MainImagePlusBoxes extends StatelessWidget {
  const MainImagePlusBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          MaingImgHolder(),
          Width20StandardWidget(),
          Smallboxesholder(),
        ],
      ),
    );
  }
}

class Smallboxesholder extends StatelessWidget {
  const Smallboxesholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Card(
            shape: smallImageShape(),
            child: const ClipsmallImg(imagePath: 'images/new/kebabrulle.jpg'),
          ),
        ),
        const Height40StandardWidget(),
        SizedBox(
          height: 70,
          width: 70,
          child: Card(
            shape: smallImageShape(),
            child: const ClipsmallImg(imagePath: 'images/new/kebab1.jpeg'),
          ),
        ),
        const Height40StandardWidget(),
        SizedBox(
          height: 70,
          width: 70,
          child: Card(
            shape: smallImageShape(),
            child: const ClipsmallImg(imagePath: 'images/new/kebab3.jpg'),
          ),
        ),
        const Height40StandardWidget(),
        SizedBox(
          height: 70,
          width: 70,
          child: Card(
            shape: smallImageShape(),
            child: const ClipsmallImg(imagePath: 'images/new/kebabrulle.jpg'),
          ),
        ),
      ],
    );
  }

//'images/new/kebabrulle.jpg' ClipsmallImg(imagePath: 'images/new/kebabrulle.jpg)
  RoundedRectangleBorder smallImageShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Define the border radius here
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
      borderRadius: BorderRadius.circular(10), // Same radius as Card
      child: Image.asset(
        imagePath, // Use the imagePath property
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    );
  }
}

class MaingImgHolder extends StatelessWidget {
  const MaingImgHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 1085,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Define the border radius here
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Same radius as Card
          child: Image.asset(
            'images/new/webb.jpg',
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        // Add other properties of Card if needed
      ),
    );
  }
}
