import 'package:flutter/material.dart';
import '../../components/sizedboxes.dart';
import 'create_introduction_box.dart';
import 'create_image_boxes.dart';

class CreateFirstRowWidget extends StatelessWidget {
  const CreateFirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        CreateIntroductionWidget(),
        Width20StandardWidget(),
        CreateMainImagePlusBoxes(),
      ],
    );
  }
}
