import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';
import '../../../components/currents/introductionholder/normal_intro/introduction_box.dart';
import '../../../components/currents/imgholders/normal/image_boxes.dart';

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        IntroductionWidget(showIntrodisplay: true),
        Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}
