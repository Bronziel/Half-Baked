import 'package:flutter/material.dart';
import '../Introduction/descriptionpop/descriptionpopupp.dart';

class DescriptionDialog {
  static void addDescription(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print('new description dialog');
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: DescriptionPopupp(
            title: 'Description',
          ),
        );
      },
    );
  }
}
