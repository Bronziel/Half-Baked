import 'package:flutter/material.dart';
import 'smallimages.dart';

import '../../../styles/spacing/sizedboxes.dart';
import 'redoneImage.dart';

class MainImagePlusBoxes extends StatelessWidget {
  const MainImagePlusBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          BigImageBoxes1(
            imagePath: 'images/new/webb.jpg',
          ),
          Width20StandardWidget(),
          PreviewBoxholder(),
        ],
      ),
    );
  }
}


/*MaingImgHolder(
            imagePath: 'images/new/webb.jpg',
          ), */