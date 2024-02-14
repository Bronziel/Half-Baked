import 'package:flutter/material.dart';
import 'styletest.dart';
import 'textfieldtest.dart';
import 'dropdowntest.dart';
import 'buttontest.dart';

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
