import 'package:flutter/material.dart';
import 'styletest.dart';
import 'textfieldtest.dart';
import 'dropdowntest.dart';

//Detta är ingridnetbox save
//on save text controller
//text field controller sen on save return Mydata(thetext: mycontroller.text)
// add items.list mycontroller.text
class IngPoptest extends StatelessWidget {
  final String title;

  final String labelText;
  final String labelText2;

  final String hintText;
  final String hintText2;

  final bool isPortionSize;

  const IngPoptest({
    required this.labelText,
    required this.labelText2,
    this.hintText = '',
    this.hintText2 = '',
    required this.title,
    this.isPortionSize = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Utilstest.ingpop(
      Card(
        color: StyleUtilstest.cardcolorgrey(),
        child: Stack(
          children: [
            Titlestest(title: title),
            Smalltextfieldtest(
              labelText: labelText,
              hintText: hintText,
              bottom: 160,
            ),
            Numberonlytextfieltest(
              isPortionSize: false,
              labelText: labelText2,
              hintText: hintText2,
              bottom: 85,
            ),
            //85
            const Unitdropdowntest(),
            const PostionedStopButtontest(),
            const PostionedSaveButtontest(),
          ],
        ),
      ),
    );
  }
}

class PostionedSaveButtontest extends StatelessWidget {
  const PostionedSaveButtontest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 10,
      right: 10,
      child: SaveButtontest(),
    );
  }
}

class SaveButtontest extends StatelessWidget {
  const SaveButtontest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // add to list
      //set state
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleUtilstest.mainncolor(),
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
    );
  }
}

//close button
class PostionedStopButtontest extends StatelessWidget {
  const PostionedStopButtontest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 10,
      right: 10,
      child: Stopdownbutton(),
    );
  }
}

class Stopdownbutton extends StatelessWidget {
  const Stopdownbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      color: const Color(0xFF000000),
      icon: const Icon(Icons.close), // Plus icon
      onPressed: () {
        Navigator.of(context).pop();
        // Add your action for this button
      },
    );
  }
}

class Titlestest extends StatelessWidget {
  const Titlestest({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 10,
        top: 10,
        child: Text(
          title,
          style: StyleUtilstest.titelstylepop(),
        ));
  }
}
