import 'package:flutter/material.dart';
import '../Introduction/descriptionpop/descriptionpopupp.dart';

class DescriptionDialog {
  static void addDescription(
    final Function(String) addDescription,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: DescriptionPopupp(
            addDescription: addDescription,
            title: 'Description',
          ),
        );
      },
    );
  }

  static void editDescription(
    final Function(String) addDescription,
    final Function(String) editDescription,
    final String initialDescription,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: DescriptionPopupp(
            addDescription: addDescription,
            editDescription: editDescription,
            initialDescription: initialDescription,
            title: 'Edit Description',
            isEdit: true,
          ),
        );
      },
    );
  }
}
