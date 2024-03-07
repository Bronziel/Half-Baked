import 'package:flutter/material.dart';
import '../sharingimgholder.dart';

class BigImageBoxes1 extends StatelessWidget {
  final String imagePath;

  const BigImageBoxes1({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 1000,
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Card(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // Assuming this is a function returning a ShapeBorder
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              )),
        ),
      ),
    ));
  }
}

class SecondBigImage2 extends StatelessWidget {
  final String imagePath;
  final double aspecRatio;
  const SecondBigImage2({
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

//class to controll aspect ratio
class CustomASpectratios {
  static double get aspectLaying => 3 / 2;
  static double get aspectBoxy => 4 / 3;
  static double get aspectPhone => 16 / 9;
  static double get aspectFullbox => 1 / 1;
}

//my cliprreact class
class ClipmyImages {
  static ClipRRect myIMages(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: child,
    );
  }
}

//static methods to control size etc
class BoxTwos {
  static double get maxWidth => 1000;
  static double get maxHeight => 500;
}

class CardBoxTwos {
  static double get maxWidth => 1000;
  static double get maxHeight => 500;
}
