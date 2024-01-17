import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '..//CreateRecipes/style.dart';
import '../CreateRecipes/style_objects.dart';

//should use enum to make it more consice
class Mymenue extends StatelessWidget {
  const Mymenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SizedBox(
          child: DropdownMenu(
            enableFilter: true,
            width: 200,
            textStyle: StyleUtils.textfieldstylepop(),
            label: const Text(
              'Unit',
            ),
            hintText: 'ex ml, g , l',
            inputDecorationTheme: InputDecorationTheme(
              border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 19, 19, 19))),
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
              DropdownMenuEntry(
                value: 6,
                label: 'tsk',
                trailingIcon: Utils.info(),
              ),
              DropdownMenuEntry(
                value: 7,
                label: 'msk',
                trailingIcon: Utils.infotext(const Text('1tsk=15ml')),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
