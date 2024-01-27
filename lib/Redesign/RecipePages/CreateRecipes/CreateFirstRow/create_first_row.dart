import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';

import 'imageholder/create_image_boxes.dart';
import '../../Recipe/FirstRow/introholder2/introduction_box.dart';

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
