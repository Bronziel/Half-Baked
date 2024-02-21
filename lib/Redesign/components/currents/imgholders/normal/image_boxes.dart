import 'package:flutter/material.dart';
import 'smallimages.dart';
import 'mainimage.dart';
import '../../../spacing/sizedboxes.dart';

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
