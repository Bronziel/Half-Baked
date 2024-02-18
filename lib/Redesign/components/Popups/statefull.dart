import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/style.dart';

//need to intalitse controller  but doing that outside this  class.

// används i portionsize time card bara för siffror single rad
class NumberTextField extends StatefulWidget {
  final bool isPortionSize;
  final String labelText;
  final String hintText;
  final double bottom;
  const NumberTextField({
    required this.isPortionSize,
    required this.labelText,
    required this.hintText,
    this.bottom = 10,
    super.key,
  });

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.bottom,
      left: 10,
      right: 100,
      child: TextField(
          keyboardType:
              widget.isPortionSize ? TextInputType.text : TextInputType.number,
          inputFormatters: widget.isPortionSize
              ? []
              : [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: StyleUtils.labelstylepop(),
            hintText: widget.hintText,
            hintStyle: StyleUtils.hintstylepop(),
            border: const OutlineInputBorder(),
            enabledBorder: StyleUtils.enabledborderstyle(),
          ),
          style: StyleUtils.textfieldstylepop()),
    );
  }
}

//litet textfield använd av title stepstitle o andra en rads fält
class TitleTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final double bottom;
  const TitleTextField({
    required this.labelText,
    this.hintText = '',
    this.bottom = 10,
    super.key,
  });

  @override
  State<TitleTextField> createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Set the position for the TextField
      bottom: widget.bottom, // Adjust these values as needed
      left: 10, // Adjust these values as needed
      right: 100,

      child: TextField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: StyleUtils.labelstylepop(),
          hintText: widget.hintText,
          hintStyle: StyleUtils.hintstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
      ),
    );
  }
}

//text field for description box
class DescriptionTextField extends StatefulWidget {
  final String labeltext;
  const DescriptionTextField({
    required this.labeltext,
    super.key,
  });

  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      top: 45,
      right: 100, // Adjusted to ensure the TextField is more square-like
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.labeltext,
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

//steps textfield for saving new steps.
class StepsTextField extends StatefulWidget {
  final String labeltext;
  const StepsTextField({
    required this.labeltext,
    super.key,
  });

  @override
  State<StepsTextField> createState() => _StepsTextFieldState();
}

class _StepsTextFieldState extends State<StepsTextField> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      top: 45,
      right: 100, // Adjusted to ensure the TextField is more square-like
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.labeltext,
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
