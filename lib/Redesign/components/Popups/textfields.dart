import 'package:flutter/material.dart';
import '../styles/style.dart';
import 'package:flutter/services.dart';

//litet textfield använd av title stepstitle o andra en rads fält
class Smalltextfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double bottom;
  const Smalltextfield({
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
          labelStyle: StyleUtils.labelstylepop(),
          hintText: hintText,
          hintStyle: StyleUtils.hintstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
      ),
    );
  }
}

// används i portionsize time card bara för siffror single rad

//steps textfield for saving new steps.
class Stepstextfield extends StatelessWidget {
  final String labeltext;
  const Stepstextfield({
    required this.labeltext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      top: 45,
      right: 100, // Adjusted to ensure the TextField is more square-like
      child: TextField(
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: StyleUtils.labelstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
        maxLines: null, // Allows for unlimited lines
        minLines: 7, // Set this to a desired initial size
      ),
    );
  }
}

//text field for description box
class Descriptiontextfield extends StatelessWidget {
  final String labeltext;
  const Descriptiontextfield({
    required this.labeltext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      top: 45,
      right: 100, // Adjusted to ensure the TextField is more square-like
      child: TextField(
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: StyleUtils.labelstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
        maxLines: null, // Allows for unlimited lines
        minLines: 5, // Set this to a desired initial size
      ),
    );
  }
}
