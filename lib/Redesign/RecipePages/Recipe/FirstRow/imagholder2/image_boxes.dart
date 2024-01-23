import 'package:flutter/material.dart';
import 'smallimages.dart';
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
          MaingImgHolder(
            imagePath: 'images/new/webb.jpg',
          ),
          Width20StandardWidget(),
          Smallboxesholder(),
        ],
      ),
    );
  }
}

class MaingImgHolder extends StatelessWidget {
  final String imagePath;
  const MaingImgHolder({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 1085,
      child: Card(
        shape: smallImageShape(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Same radius as Card
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        // Add other properties of Card if needed
      ),
    );
  }
}
