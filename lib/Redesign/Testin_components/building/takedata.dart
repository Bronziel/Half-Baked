import 'package:flutter/material.dart';
import 'classforpopup.dart';

import 'dropdowntest.dart';
import 'styletest.dart';
import 'buttontest.dart';
import 'package:flutter/services.dart';

class Takedata extends StatefulWidget {
  final String title;

  final String labelText;
  final String labelText2;

  final String hintText;
  final String hintText2;

  final bool isPortionSize;
  const Takedata({
    required this.labelText,
    required this.labelText2,
    this.hintText = '',
    this.hintText2 = '',
    required this.title,
    this.isPortionSize = false,
    super.key,
  });

  @override
  State<Takedata> createState() => _TakedataState();
}

class _TakedataState extends State<Takedata> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Utilstest.ingpop(
      Card(
        color: StyleUtilstest.cardcolorgrey(),
        child: Stack(
          children: [
            Titlestest(title: widget.title),
            Smalltextfieldtest(
              myController: myController,
              labelText: widget.labelText,
              hintText: widget.hintText,
              bottom: 160,
            ),
            Numberonlytextfieltest(
              myController: myController,
              isPortionSize: false,
              labelText: widget.labelText2,
              hintText: widget.hintText2,
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

class Smalltextfieldtest extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double bottom;
  final TextEditingController myController;
  const Smalltextfieldtest({
    required this.myController,
    required this.labelText,
    this.hintText = '',
    this.bottom = 10,
    //10
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Set the position for the TextField
      bottom: bottom, // Adjust these values as needed
      left: 10, // Adjust these values as needed
      right: 100,

      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: StyleUtilstest.labelstylepop(),
          hintText: hintText,
          hintStyle: StyleUtilstest.hintstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtilstest.enabledborderstyle(),
        ),
        style: StyleUtilstest.textfieldstylepop(),
      ),
    );
  }
}

class Numberonlytextfieltest extends StatelessWidget {
  const Numberonlytextfieltest({
    required this.myController,
    super.key,
    required this.isPortionSize,
    required this.labelText,
    required this.hintText,
    this.bottom = 10,
  });
  final TextEditingController myController;
  final bool isPortionSize;
  final String labelText;
  final String hintText;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: 10,
      right: 100,
      child: TextField(
          controller: myController,
          keyboardType:
              isPortionSize ? TextInputType.text : TextInputType.number,
          inputFormatters:
              isPortionSize ? [] : [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: StyleUtilstest.labelstylepop(),
            hintText: hintText,
            hintStyle: StyleUtilstest.hintstylepop(),
            border: const OutlineInputBorder(),
            enabledBorder: StyleUtilstest.enabledborderstyle(),
          ),
          style: StyleUtilstest.textfieldstylepop()),
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

class Itemtest {
  final String label;
  final String amount;
  final String unit;

  Itemtest({required this.label, required this.amount, required this.unit});
}

final List<Itemtest> items = [
  Itemtest(label: 'maricha sås', amount: '300', unit: 'ml'),
  Itemtest(label: 'Jordgubbssylt', amount: '4', unit: 'dl'),
  Itemtest(label: 'Kebabkött', amount: '400', unit: 'g'),
  Itemtest(label: 'vitlöksås', amount: '1', unit: 'l'),
  Itemtest(label: 'vitlök', amount: '2', unit: 'st'),
  Itemtest(label: 'gullök', amount: '2000', unit: 'tsk'),
  Itemtest(label: 'honung', amount: '1000', unit: 'ml'),
  Itemtest(label: 'socker', amount: '2000', unit: 'tsk'),
  Itemtest(label: 'mjölk', amount: '1000', unit: 'ml'),
  Itemtest(label: 'Bröd', amount: '2000', unit: 'tsk'),
  Itemtest(label: 'Fetaost', amount: '1000', unit: 'ml'),
  Itemtest(label: 'Ketchup', amount: '2000', unit: 'tsk'),
  // ... more items
];
