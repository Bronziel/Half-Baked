import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/style.dart';

//need to intalitse controller  but doing that outside this  class.
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
