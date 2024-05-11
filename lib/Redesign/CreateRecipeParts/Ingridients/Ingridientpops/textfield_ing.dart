import 'package:flutter/material.dart';
import '../../../components/styles/style.dart';
import '../../../components/styles/style_objects.dart';
import 'package:flutter/services.dart';

class TitleTextField extends StatelessWidget {
  final String? errorText1;
  final TextEditingController titleController;
  final String labelText;
  final String hintText;
  final double bottom;
  const TitleTextField({
    this.errorText1,
    required this.titleController,
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
        controller: titleController,
        decoration: InputDecoration(
          errorText: errorText1,
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
class NumberTextField extends StatelessWidget {
  const NumberTextField({
    this.errorText2,
    required this.numberController,
    super.key,
    required this.labelText,
    required this.hintText,
    this.bottom = 10,
  });
  final String? errorText2;
  final TextEditingController numberController;

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
          controller: numberController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            errorText: errorText2,
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

class DropDownMenueTextField extends StatelessWidget {
  final String? errorText3;
  final double bottom;
  final TextEditingController dropdownController;
  const DropDownMenueTextField({
    this.errorText3,
    required this.dropdownController,
    this.bottom = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Set the position for the TextField
      bottom: bottom, // Adjust these values as needed
      left: 10, // Adjust these values as needed
      right: 100,
      child: DropdownMenu(
        errorText: errorText3,
        controller: dropdownController,
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
      ),
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

class SaveButtonIng extends StatelessWidget {
  final VoidCallback onPressed;
  const SaveButtonIng({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: ElevatedButton(
        //dont need ()=> its just calling a void callbakc so it cant carry value
        onPressed: () => onPressed(),
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
