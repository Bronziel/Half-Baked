import 'package:flutter/material.dart';
import 'imagesclass.dart';

class Widht40wallWidget extends StatelessWidget {
  const Widht40wallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
    );
  }
}

class Width20StandardWidget extends StatelessWidget {
  const Width20StandardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
    );
  }
}

class Height20StandardWidget extends StatelessWidget {
  const Height20StandardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class Height40StandardWidget extends StatelessWidget {
  const Height40StandardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
    );
  }
}

//this is the prep and total time tile
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

//this is the portionsize tile
class PortionsizeCardWidget extends StatelessWidget {
  const PortionsizeCardWidget({
    super.key,
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
            const Text(
              "12",
              style: TextStyle(
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
