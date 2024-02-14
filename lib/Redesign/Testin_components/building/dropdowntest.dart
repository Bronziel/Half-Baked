import 'package:flutter/material.dart';
import 'styletest.dart';

class Boxwithdroptest extends StatelessWidget {
  const Boxwithdroptest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      //expandedinset makes so that the menu takes size of parent otehrwise need set widh
      expandedInsets: EdgeInsets.zero,
      enableFilter: true,
      textStyle: StyleUtilstest.textfieldstylepop(),
      label: const Text(
        'Unit',
      ),
      hintText: 'ex ml, g , l',
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 19, 19, 19))),
        enabledBorder: StyleUtilstest.enabledborderstyle(),
        hintStyle: StyleUtilstest.hintstylepop(),
      ),
      dropdownMenuEntries: <DropdownMenuEntry>[
        DropdownMenuEntry(
          value: 1,
          label: 'ml',
          trailingIcon: Utilstest.info(),
        ),
        DropdownMenuEntry(
          value: 2,
          label: 'dl',
          trailingIcon: Utilstest.info(),
        ),
        DropdownMenuEntry(
          value: 3,
          label: 'cl',
          trailingIcon: Utilstest.info(),
        ),
        DropdownMenuEntry(
          value: 'l',
          label: 'liter',
          trailingIcon: Utilstest.info(),
        ),
        DropdownMenuEntry(
          value: 4,
          label: 'g',
          trailingIcon: Utilstest.info(),
        ),
        const DropdownMenuEntry(
          value: 6,
          label: 'tsk',
          trailingIcon: Tooltipinfotest(
            message: '1tsk = 5ml',
          ),
        ),
        const DropdownMenuEntry(
          value: 7,
          label: 'msk',
          trailingIcon: Tooltipinfotest(
            message: '1msk=15ml',
          ),
        ),
      ],
    );
  }
}

class Unitdropdowntest extends StatelessWidget {
  final double bottom;
  const Unitdropdowntest({
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

      child: const Boxwithdroptest(),
    );
  }
}

class Tooltipinfotest extends StatelessWidget {
  final String message;
  const Tooltipinfotest({
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
      textStyle: StyleUtilstest.textfieldstylepop(),
      child: Utilstest.info(),
    );
  }
}
