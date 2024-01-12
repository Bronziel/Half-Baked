import 'package:flutter/material.dart';
import 'imagesclass.dart';

//this is the widget that show prep and total time tile
class TimeCard extends StatelessWidget {
  final String title;
  final String time;

  const TimeCard({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
          children: [
            const SizedBox(width: 9),
            Image.asset('images/new/icons/clock.png'),
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
        ),
      ),
    );
  }
}

//time card to enter total and prep time
class CreateTimeCard extends StatelessWidget {
  final String title;

  const CreateTimeCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
          children: [
            const SizedBox(width: 9),
            Image.asset('images/new/icons/clock.png'),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.add), // Plus icon
              onPressed: () {
                // Add your action for this button
              },
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
        ),
      ),
    );
  }
}

//this is the portionsize tile
class PortionsizeCardWidget extends StatelessWidget {
  final String portion;

  // The constructor now includes an optional 'portion' parameter
  const PortionsizeCardWidget({
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

//to add portion size number widget
class CreatePortionsizeCardWidget extends StatelessWidget {
  const CreatePortionsizeCardWidget({
    super.key,
    // Add any other parameters you might need
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
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
            IconButton(
              icon: const Icon(Icons.add), // Plus icon
              onPressed: () {
                // Add your action for this button
              },
            ),
            const SizedBox(width: 6),
            Image.asset('images/new/icons/man.png'),
          ],
        ),
      ),
    );
  }
}
