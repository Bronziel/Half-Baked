import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '..//CreateRecipes/style.dart';

class Mymenue extends StatelessWidget {
  const Mymenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        SizedBox(
          child: DropdownMenu(
            width: 200,
            textStyle: StyleUtils.textfieldstylepop(),
            label: const Text(
              'Unit',
            ),
            hintText: 'ex ml, g , l',
            dropdownMenuEntries: const <DropdownMenuEntry>[
              DropdownMenuEntry(
                  value: Colors.red,
                  label: 'RED',
                  trailingIcon: Icon(
                    Icons.info_outline,
                    size: 20,
                  )),
              DropdownMenuEntry(value: Colors.black, label: 'label'),
            ],
          ),
        ),
      ],
    ));
  }
}
