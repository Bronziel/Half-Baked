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
        ),
      ],
    ));
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
