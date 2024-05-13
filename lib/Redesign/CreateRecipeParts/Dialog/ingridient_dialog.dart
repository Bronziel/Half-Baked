import 'package:flutter/material.dart';
import '../Ingridients/Ingridientpops/ingridient_popupp.dart';

class IngDialog {
  //nested method (){method2(){}}
  static void addIng(
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

  static void editIng(
    //new
    BuildContext context,
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
}
