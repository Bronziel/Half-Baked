import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styletest.dart';

class Smalltextfieldtest extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double bottom;
  const Smalltextfieldtest({
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
    super.key,
    required this.isPortionSize,
    required this.labelText,
    required this.hintText,
    this.bottom = 10,
  });

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
