import 'package:flutter/material.dart';
import '../Introduction/introPop/intro_popup.dart';

class TitelDialog {
  static void addTitel(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: IntroductionPopupp(
            title: 'Title:',
            labelText: 'Add a title',
            hintText: 'Ex Kebabrulle',
          ),
        );
      },
    );
  }
}

class DescriptionDialog {}
