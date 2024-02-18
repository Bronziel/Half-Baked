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

  final myController = TextEditingController();
  final mySecondController = TextEditingController();
  final myThirdController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    mySecondController.dispose();
    myThirdController.dispose();
    super.dispose();
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
              titleController: myController,
              labelText: widget.labelText,
              hintText: widget.hintText,
              bottom: 160,
            ),
            Numberonlytextfiel2(
              errorText2: errorText2,
              numberController: mySecondController,
              isPortionSize: false,
              labelText: widget.labelText2,
              hintText: widget.hintText2,
              bottom: 85,
            ),
            //85
            Boxwithdrop2(
              errorText3: errorText3,
              dropdownController: myThirdController,
            ),
            const PostionedStopButton(),
            SaveButtonCreate(
              myController: myController,
              mySecondController: mySecondController,
              myThirdController: myThirdController,
            ),
          ],
        ),
      ),
    );
  }
}

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

class SaveButtonCreate extends StatefulWidget {
  final String? errorText1;
  final String? errorText2;
  final String? errorText3;
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
