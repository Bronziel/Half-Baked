import 'package:flutter/material.dart';
import '../buttons.dart';

//this is the portionsize tile
class PortionsizeCardWidget extends StatelessWidget {
  final String portion;
  final bool showdisplayport;

  // The constructor now includes an optional 'portion' parameter
  const PortionsizeCardWidget({
    required this.showdisplayport,
    super.key,
    this.portion = '', // Default is an empty string if no value is provided
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: showdisplayport ? displayport() : addport(),
      ),
    );
  }

  Widget displayport() {
    return displayportion(portion: portion);
  }

  Widget addport() {
    return const addportion();
  }
}

//displayportion(portion: portion)

class displayportion extends StatelessWidget {
  const displayportion({
    super.key,
    required this.portion,
  });

  final String portion;

  @override
  Widget build(BuildContext context) {
    return Row(
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

class addportion extends StatelessWidget {
  const addportion({
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
        const Addbuttoncontainer(
          color: Color(0xFF000000),
        ),

        const SizedBox(width: 6),
        Image.asset('images/new/icons/man.png'),
      ],
    );
  }
}
