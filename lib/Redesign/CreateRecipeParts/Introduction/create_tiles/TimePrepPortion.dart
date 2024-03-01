import 'package:flutter/material.dart';
import '../../Introduction/create_title.dart';
import 'package:fb2/Redesign/CreateRecipeParts/Dialog/buttons_dialog/buttons.dart';
import 'package:fb2/Redesign/components/styles/uifixedtimecard.dart';

class Addtimes extends StatelessWidget {
  final VoidCallback onPressed;

  final String titleadd;
  const Addtimes({
    required this.onPressed,
    super.key,
    required this.titleadd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 9),
        const Clockimg(),
        const SizedBox(width: 5),
        Text(
          titleadd,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 8),
        Addbuttoncontainer(
          onPressed: onPressed,
          color: const Color(0xFF000000),
        ),
        const SizedBox(width: 1),
        const Text(
          "min",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class Displaytimes extends StatelessWidget {
  final String title;
  final String time;
  final VoidCallback editText;
  const Displaytimes({
    super.key,
    required this.title,
    required this.time,
    required this.editText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 9),
        Editcontainer(
          editColor: Colors.black,
          onPressedEdit: editText,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          time,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 1),
        const Text(
          "min",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class Addportion extends StatelessWidget {
  final VoidCallback onPressed;
  const Addportion({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 7.2),
        Image.asset('images/new/icons/portion.png'),
        const SizedBox(width: 4.99),
        const Text(
          "Portionsize:",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 9),
        // Replace this Text widget with IconButton
        Addbuttoncontainer(
          onPressed: onPressed,
          color: const Color(0xFF000000),
        ),

        const SizedBox(width: 6),
        Image.asset('images/new/icons/man.png'),
      ],
    );
  }
}

class Displayportion extends StatelessWidget {
  final VoidCallback onPressed;
  final String portion;
  const Displayportion({
    super.key,
    required this.portion,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 7.2),
        Editcontainer(
          editColor: Colors.black,
          onPressedEdit: onPressed,
        ),
        const SizedBox(width: 4.99),
        const Text(
          "Portionsize:",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 9),
        Text(
          portion, // Use the 'portion' parameter here
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 6),
        Image.asset('images/new/icons/man.png'),
      ],
    );
  }
}
