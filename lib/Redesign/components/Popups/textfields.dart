import 'package:flutter/material.dart';
import '../styles/style.dart';
import '../styles/style_objects.dart';
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
class Numberonlytextfiel extends StatelessWidget {
  const Numberonlytextfiel({
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
            labelStyle: StyleUtils.labelstylepop(),
            hintText: hintText,
            hintStyle: StyleUtils.hintstylepop(),
            border: const OutlineInputBorder(),
            enabledBorder: StyleUtils.enabledborderstyle(),
          ),
          style: StyleUtils.textfieldstylepop()),
    );
  }
}

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

class Unitdropdown extends StatelessWidget {
  final double bottom;
  const Unitdropdown({
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

      child: const Boxwithdrop(),
    );
  }
}

class Boxwithdrop extends StatelessWidget {
  const Boxwithdrop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
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
    );
  }
}

//'1msk=15ml'
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
