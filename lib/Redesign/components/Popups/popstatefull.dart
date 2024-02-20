import 'package:flutter/material.dart';
import 'statefull.dart';
import '../styles/style_objects.dart';
import '../styles/style.dart';
import 'popup_components.dart';

import '../currents/ingholder/lists.dart';
import '../currents/ingholder/ing_add_tile.dart';
import '../currents/ingholder/maintile.dart';
import '../currents/ingholder/lists.dart';
import 'statefull2.dart';

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
      items.add(Item(label: title, amount: amount, unit: unit));
      print(items);
      //set new state for ing here when item added to renew list state.
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IngMainTile(
            showMaintile:
                false), //controls wich main tile size.we get since false we get the bigger one
        Addinngtile(), //tile to add new ingridninets
        Expanded(
          child: ListOfIng(), //specila list for ingridinets
        ),
      ],
    );
  }
}

class IngridientPopupp extends StatefulWidget {
  final String title;
  final String labelText;
  final String labelText2;
  final String hintText;
  final String hintText2;
  final bool isPortionSize;
  const IngridientPopupp({
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
      //create state so i dont have to write it out all the time
      final state =
          context.findAncestorStateOfType<_CreateListWithIngridientsState>();
      if (state != null) {
        print('3');
        state.addItem(
          titleController.text,
          numberController.text,
          dropdownController.text,
        );
      }
      // Clear the text fields after adding
      titleController.clear();
      numberController.clear();
      dropdownController.clear();
      print('4');
      Navigator.of(context).pop();
      print('close dialog');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Utils.ingpop(
      Card(
        color: Colors.amber,
        child: Stack(
          children: [
            Titles(title: widget.title),
            Smalltextfield2(
              errorText1: errorText1,
              titleController: titleController,
              labelText: widget.labelText,
              hintText: widget.hintText,
              bottom: 160,
            ),
            Numberonlytextfiel2(
              errorText2: errorText2,
              numberController: numberController,
              isPortionSize: false,
              labelText: widget.labelText2,
              hintText: widget.hintText2,
              bottom: 85,
            ),
            //85
            Boxwithdrop2(
              errorText3: errorText3,
              dropdownController: dropdownController,
            ),
            const PostionedStopButton(),
            SaveButtonsCreate2(
              onPressed: () => saveData(),
            ),
          ],
        ),
      ),
    );
  }
}

class SaveButtonCreate extends StatefulWidget {
  String? errorText1;
  String? errorText2;
  String? errorText3;
  var myController = TextEditingController();
  var mySecondController = TextEditingController();
  var myThirdController = TextEditingController();

  SaveButtonCreate({
    this.errorText1,
    this.errorText2,
    this.errorText3,
    required this.myController,
    required this.mySecondController,
    required this.myThirdController,
    super.key,
  });

  @override
  State<SaveButtonCreate> createState() => _SaveButtonCreateState();
}

class _SaveButtonCreateState extends State<SaveButtonCreate> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.errorText1 = widget.myController.text.isEmpty
                ? 'Field cannot be empty'
                : null;
            widget.errorText2 = widget.mySecondController.text.isEmpty
                ? 'Field cannot be empty'
                : null;
          });
          if (widget.errorText1 == null && widget.errorText2 == null) {
            //create state so i dont have to write it out all the time
            final state = context
                .findAncestorStateOfType<_CreateListWithIngridientsState>();
            if (state != null) {
              state.addItem(
                widget.myController.text,
                widget.mySecondController.text,
                widget.myThirdController.text,
              );
            }
            // Clear the text fields after adding
            widget.myController.clear();
            widget.mySecondController.clear();
            widget.myThirdController.clear();
          }
        },
        // add to list
        //set state
        style: ElevatedButton.styleFrom(
          backgroundColor: StyleUtils.mainncolor(),
          padding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 12), // Padding inside the button
          // Other style properties
        ),
        child: const Row(
          mainAxisSize:
              MainAxisSize.min, // Use min to wrap content inside the button
          children: <Widget>[
            Icon(Icons.add, color: Color(0xFFFFFFFF)), // Your icon
            SizedBox(width: 8), // Space between icon and text
            Text(
              'Save',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ), // Your text
          ],
        ),
      ),
    );
  }
}
