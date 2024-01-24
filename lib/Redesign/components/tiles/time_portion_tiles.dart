import 'package:flutter/material.dart';
import '../currents/buttons.dart' show Addbuttoncontainer;

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
            const clockimg(),
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
            const clockimg(),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            const Addbuttoncontainer(
              color: Color(0xFF000000),
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

class clockimg extends StatelessWidget {
  const clockimg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/new/icons/clock.png');
  }
}
