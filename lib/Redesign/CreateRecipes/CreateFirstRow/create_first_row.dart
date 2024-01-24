import 'package:flutter/material.dart';
import '../../components/spacing/sizedboxes.dart';
import 'introductionholder/create_introduction_box.dart';
import 'imageholder/create_image_boxes.dart';

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
