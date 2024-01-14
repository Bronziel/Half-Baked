import 'package:flutter/material.dart';
import '../../../components/components_redesign.dart';
import '../../../components/sizedboxes.dart';
import '../../../components/sizedboxes.dart';
import 'introduction_box.dart';
import 'Image_Boxes.dart';

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Widht40wallWidget(),
        const IntroductionWidget(),
        const Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}
