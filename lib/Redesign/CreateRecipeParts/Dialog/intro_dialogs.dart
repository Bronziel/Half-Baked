import 'package:flutter/material.dart';
import '../Introduction/introPop/intro_popup.dart';

class TitelDialog {
  static void addTitel(
    BuildContext context,
    Function(String) addTitel,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print('open titel Dialog');
        return Dialog(
          backgroundColor: Colors.transparent,
          child: IntroductionPopupp(
            addTitel: addTitel,
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
