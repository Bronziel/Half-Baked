import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';
import 'introholder2/introduction_box.dart';
import 'imagholder2/image_boxes.dart';

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
