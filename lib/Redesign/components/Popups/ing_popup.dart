import 'package:flutter/material.dart';
import '../styles/style_objects.dart';
import '../styles/style.dart';
import 'popup_components.dart';

import '../currents/ingholder/lists.dart';
import '../currents/ingholder/ing_add_tile.dart';
import '../currents/ingholder/maintile.dart';
import '../currents/ingholder/lists.dart';
import 'textfield_ing.dart';

class CreateListWithIngridients extends StatefulWidget {
  const CreateListWithIngridients({super.key});

  @override
  State<CreateListWithIngridients> createState() =>
      _CreateListWithIngridientsState();
}

class _CreateListWithIngridientsState extends State<CreateListWithIngridients> {
  void addItem(String title, String amount, String unit) {
    setState(() {
      //parameter för sätta vilken info är vad items kräver mytext.vi säger hämta text från textfield
      ingredients.add(Ingredients(label: title, amount: amount, unit: unit));
      print('lagt till item');
      //set new state for ing here when item added to renew list state.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IngMainTile(
            showMaintile:
                false), //controls wich main tile size.we get since false we get the bigger one
        Addinngtile(addItemCallback: addItem), //tile to add new ingridninets
        Expanded(
          child: ListOfIng(), //specila list for ingridinets
        ),
      ],
    );
  }
}

class IngridientPopupp extends StatefulWidget {
  //new
  final Function(String, String, String) addItem;
  final String title;
  final String labelText;
  final String labelText2;
  final String hintText;
  final String hintText2;
  final bool isPortionSize;
  const IngridientPopupp({
    //new
    required this.addItem,
    required this.labelText,
    required this.labelText2,
    this.hintText = '',
    this.hintText2 = '',
    required this.title,
    this.isPortionSize = false,
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
    titleController = TextEditingController();
    numberController = TextEditingController();
    dropdownController = TextEditingController();
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

    if (errorText1 == null && errorText2 == null && errorText3 == null) {
      print('2');
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
  }

  @override
  Widget build(BuildContext context) {
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
              isPortionSize: false,
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