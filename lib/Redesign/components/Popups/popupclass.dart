import 'package:fb2/Redesign/components/Popups/popup_boxes.dart';
import 'package:flutter/material.dart';
import '../../CreateRecipeParts/Ingridients/Ingridientpops/ingridient_popupp.dart';
import '../../CreateRecipeParts/Ingridients/Parent_Ing.dart';

//onPressed: () => DialogUtils.showIngPopDialog(context)
class DialogUtils {
  //not retuurn value insted retunr action
  //showIngPopDialog

  static void showIngPopDialog(
    //new
    BuildContext context,
    Function(String, String, String) addItemCallback,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print('dialog open');
        return Dialog(
          backgroundColor: Colors.transparent,
          child: IngridientPopupp(
            //new
            addItem: addItemCallback,
            title: "Ingredient Details",
            labelText: "Ingredient",
            labelText2: "Quantity",
            hintText: "Enter ingredient name",
            hintText2: "Enter quantity",
          ),
        );
      },
    );
  }

  static void showIngPopDialogEdit(
    //new
    BuildContext context,
    Function(String, String, String) addItemCallback,
    int index,
    String label,
    String amount,
    String unit,
    Function(int, String, String, String) editItem,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print('dialog open edit');
        print(index);
        return Dialog(
          backgroundColor: Colors.transparent,
          child: IngridientPopupp(
            //new
            addItem: addItemCallback,
            title: "Edit Ingredient Details",
            labelText: "Ingredient",
            labelText2: "Quantity",
            hintText: "Enter ingredient name",
            hintText2: "Enter quantity",
            initialTitle: label,
            initialNumber: amount,
            initialDropdownValue: unit,
            isEdit: true,
            index: index,
            editItem: editItem,
          ),
        );
      },
    );
  }

  static void showTitelDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: SmallTextfieldPop(
            title: 'Title:',
            labelText: 'Add a title',
            hintText: 'Ex Kebabrulle',
          ),
        );
      },
    );
  }

  static void showDescriptionDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: PopDescription(
            title: 'Description',
          ),
        );
      },
    );
  }

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

  static void showPortionsizeDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: PopTimePort(
            title: 'Portionsize:',
            labelText: 'Add Portion size',
            isPortionSize: true, // Used to set the keyboard type to text
          ),
        );
      },
    );
  }

  static void showTimePrepDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: PopTimePort(
            title: 'PrepTime:',
            labelText: 'Add Preperation time',
            hintText:
                'preparation time in minutes', // Used to set the keyboard type to text
          ),
        );
      },
    );
  }

  static void showTimeTotalDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: PopTimePort(
            title: 'TotalTime:',
            labelText: 'Add Total cooking time',
            hintText: 'Total cooking time in minutes',
          ),
        );
      },
    );
  }
}
/* static void showIngPopDialog(BuildContext context, {required String title, required String labelText, required String labelText2, String hintText = '', String hintText2 = ''}) {
    showDialog(
      context: context, */

