import 'package:fb2/Redesign/components/Popups/popup_boxes.dart';
import 'package:flutter/material.dart';

//onPressed: () => DialogUtils.showIngPopDialog(context)
class DialogUtils {
  //not retuurn value insted retunr action
  //showIngPopDialog

  static void showStepsTitelDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: SmallTextfieldPop(
            title: 'Steps Title:',
            labelText: 'Add a steps title',
            hintText: 'Ex Sidesallad, Prepping meat',
          ),
        );
      },
    );
  }
}
/* static void showIngPopDialog(BuildContext context, {required String title, required String labelText, required String labelText2, String hintText = '', String hintText2 = ''}) {
    showDialog(
      context: context, */

