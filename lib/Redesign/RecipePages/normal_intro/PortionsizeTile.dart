import 'package:flutter/material.dart';

class DisplayPortionsizeCardWidget extends StatelessWidget {
  const DisplayPortionsizeCardWidget({
    super.key,
    required this.portion,
  });

  final String portion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
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
        ),
      ),
    );
  }
}
