import 'package:flutter/material.dart';
import 'smallimages.dart';
import '../../../../components/currents/sharingimgholder.dart';

class MaingImgHolder extends StatelessWidget {
  final String imagePath;
  const MaingImgHolder({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightimage,
      width: widthbigimage,
      child: Card(
        shape: smallImageShape(),
        child: ClipImg(imagePath: imagePath),
        // Add other properties of Card if needed
      ),
    );
  }
}
