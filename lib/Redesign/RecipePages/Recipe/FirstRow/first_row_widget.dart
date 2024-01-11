import 'package:flutter/material.dart';
import '../../../components/ComponentsRedesign.dart';
import 'Introduction_Box.dart';
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
