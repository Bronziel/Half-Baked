import 'package:fb2/Redesign/components/Popups/popup_components.dart';
import 'package:fb2/Redesign/CreateRecipeParts/Ingridients/Ingridientpops/textfield_ing.dart';
import 'package:fb2/Redesign/components/styles/style.dart';
import 'package:fb2/Redesign/components/styles/style_objects.dart';
import 'package:flutter/material.dart';

class IngridientPopupp extends StatefulWidget {
  //new
  final Function(String, String, String) addItem;
  final String title;
  final String labelText;
  final String labelText2;
  final String hintText;
  final String hintText2;

//yes
  final Function(int, String, String, String)? editItem;
  final int index;
  final bool isEdit;
  final String? initialTitle;
  final String? initialNumber;
  final String? initialDropdownValue;
  const IngridientPopupp({
    this.editItem,
    this.index = 0,
    this.isEdit = false,
    this.initialTitle,
    this.initialNumber,
    this.initialDropdownValue,
    //new
    required this.addItem,
    required this.labelText,
    required this.labelText2,
    this.hintText = '',
    this.hintText2 = '',
    required this.title,
    super.key,
  });

  @override
  State<IngridientPopupp> createState() => _IngridientPopuppState();
}

class _IngridientPopuppState extends State<IngridientPopupp> {
  String? errorText1;
  String? errorText2;
  String? errorText3;

  late TextEditingController titleController;
  late TextEditingController numberController;
  late TextEditingController dropdownController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    numberController = TextEditingController(text: widget.initialNumber);
    dropdownController =
        TextEditingController(text: widget.initialDropdownValue);
  }

  @override
  void dispose() {
    titleController.dispose();
    numberController.dispose();
    dropdownController.dispose();
    super.dispose();
  }

  void saveData() {
    // Example validation function
    setState(() {
      errorText1 =
          titleController.text.isEmpty ? 'Field cannot be empty' : null;
      errorText2 =
          numberController.text.isEmpty ? 'Field cannot be empty' : null;
      errorText3 =
          dropdownController.text.isEmpty ? 'Field cannot be empty' : null;
    });
    print('1');

    if (errorText1 == null &&
        errorText2 == null &&
        errorText3 == null &&
        widget.isEdit == false) {
      print('2');
      //another if statemetn if prefilled else widget.additem
      // Call the addItem callback directly with the values
      widget.addItem(
        titleController.text,
        numberController.text,
        dropdownController.text,
      );
      print('3');

      // Clear the text fields after adding
      titleController.clear();
      numberController.clear();
      dropdownController.clear();
      print('4');

      Navigator.of(context).pop(); // Close the dialog
    }
    if (errorText1 == null &&
        errorText2 == null &&
        errorText3 == null &&
        widget.isEdit == true) {
      print('edit mode save process');
      //another if statemetn if prefilled else widget.additem
      // Call the addItem callback directly with the values
      //Edititem.widget etc....

      widget.editItem!(
        widget.index,
        titleController.text,
        numberController.text,
        dropdownController.text,
      );

      // Clear the text fields after adding
      titleController.clear();
      numberController.clear();
      dropdownController.clear();

      Navigator.of(context).pop(); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilt??');
    return Utils.ingpop(
      Card(
        color: StyleUtils.cardcolorgrey(),
        child: Stack(
          children: [
            Titles(title: widget.title),
            TitleTextField(
              errorText1: errorText1,
              titleController: titleController,
              labelText: widget.labelText,
              hintText: widget.hintText,
              bottom: 160,
            ),
            NumberTextField(
              errorText2: errorText2,
              numberController: numberController,
              labelText: widget.labelText2,
              hintText: widget.hintText2,
              bottom: 85,
            ),
            //85
            DropDownMenueTextField(
              errorText3: errorText3,
              dropdownController: dropdownController,
            ),
            const PostionedStopButton(),
            SaveButtonIng(
              onPressed: () => saveData(),
            ),
          ],
        ),
      ),
    );
  }
}
//we eat a lot of food today