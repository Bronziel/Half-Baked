import 'package:flutter/material.dart';
import 'smallimages.dart';

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
        child: ClipsmallImg(imagePath: imagePath),
        // Add other properties of Card if needed
      ),
    );
  }
}
