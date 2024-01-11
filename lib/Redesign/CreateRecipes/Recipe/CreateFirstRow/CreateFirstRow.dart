import 'package:flutter/material.dart';
import '../../../components/ComponentsRedesign.dart';
import 'CreateIntroduction_Box.dart';
import 'CreateImage_Boxes.dart';

class CreateFirstRowWidget extends StatelessWidget {
  const CreateFirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Widht40wallWidget(),
        const CreateIntroductionWidget(),
        const Width20StandardWidget(),
        CreateMainImagePlusBoxes(),
      ],
    );
  }
}
