import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';

import '../../../components/currents/imgholders/image_create_hold/create_image_boxes.dart';
import '../../../components/currents/introductionholder/normal_intro/introduction_box.dart';

class CreateFirstRowWidget extends StatelessWidget {
  const CreateFirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        IntroductionWidget(showIntrodisplay: false),
        Width20StandardWidget(),
        CreateMainImagePlusBoxes(),
      ],
    );
  }
}
