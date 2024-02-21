import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/style.dart';
import '../styles/style_objects.dart';

//need to intalitse controller  but doing that outside this  class.

// används i portionsize time card bara för siffror single rad

//litet textfield använd av title stepstitle o andra en rads fält

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

//används i dropdown men kan behvöer unitdropdown class
class DropDownMenueTextField extends StatefulWidget {
  final String? errorText3;
  final TextEditingController dropdownController;
  final double bottom;
  const DropDownMenueTextField({
    this.errorText3,
    required this.dropdownController,
    this.bottom = 10,
    super.key,
  });

  @override
  State<DropDownMenueTextField> createState() => _DropDownMenueTextFieldState();
}

class _DropDownMenueTextFieldState extends State<DropDownMenueTextField> {
  @override
  Widget build(BuildContext context) {
    //add controller inside  dropdownmenue
    return Positioned(
      // Set the position for the TextField
      bottom: widget.bottom, // Adjust these values as needed
      left: 10, // Adjust these values as needed
      right: 100,
      child: DropdownMenu(
        errorText: widget.errorText3,
        controller: widget.dropdownController,
        //expandedinset makes so that the menu takes size of parent otehrwise need set widh
        expandedInsets: EdgeInsets.zero,
        enableFilter: true,
        textStyle: StyleUtils.textfieldstylepop(),
        label: const Text(
          'Unit',
        ),
        hintText: 'ex ml, g , l',
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 19, 19, 19))),
          enabledBorder: StyleUtils.enabledborderstyle(),
          hintStyle: StyleUtils.hintstylepop(),
        ),
        //extract??
        dropdownMenuEntries: <DropdownMenuEntry>[
          DropdownMenuEntry(
            value: 1,
            label: 'ml',
            trailingIcon: Utils.info(),
          ),
          DropdownMenuEntry(
            value: 2,
            label: 'dl',
            trailingIcon: Utils.info(),
          ),
          DropdownMenuEntry(
            value: 3,
            label: 'cl',
            trailingIcon: Utils.info(),
          ),
          DropdownMenuEntry(
            value: 'l',
            label: 'liter',
            trailingIcon: Utils.info(),
          ),
          DropdownMenuEntry(
            value: 4,
            label: 'g',
            trailingIcon: Utils.info(),
          ),
          const DropdownMenuEntry(
            value: 6,
            label: 'tsk',
            trailingIcon: Tooltipinfo(
              message: '1tsk = 5ml',
            ),
          ),
          const DropdownMenuEntry(
            value: 7,
            label: 'msk',
            trailingIcon: Tooltipinfo(
              message: '1msk=15ml',
            ),
          ),
        ],
      ),
    );
  }
}

class Tooltipinfo extends StatelessWidget {
  final String message;
  const Tooltipinfo({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFF161414),
          width: 1,
        ),
      ),
      textStyle: StyleUtils.textfieldstylepop(),
      child: Utils.info(),
    );
  }
}
