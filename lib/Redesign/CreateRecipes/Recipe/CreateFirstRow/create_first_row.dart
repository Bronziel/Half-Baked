import 'package:flutter/material.dart';
import '../../../components/ComponentsRedesign.dart';
import '../../../components/sizedboxes.dart';
import '../../../components/sizedboxes.dart';
import 'create_introduction_Box.dart';
import 'CreateImage_Boxes.dart';

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
