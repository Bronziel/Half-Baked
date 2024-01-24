import 'package:flutter/material.dart';
import '../../currents/buttons.dart' show Addbuttoncontainer;

//this is the widget that show prep and total time tile
class TimeCard extends StatelessWidget {
  final String title;
  final String time;
  final String titleadd;
  final bool showdisplaytime;

  const TimeCard({
    required this.showdisplaytime,
    super.key,
    required this.titleadd,
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
        child: showdisplaytime ? displaytime() : addtime(),
      ),
    );
  }

  Widget displaytime() {
    return displaytimes(title: title, time: time);
  }

  Widget addtime() {
    return addtimes(titleadd: titleadd);
  }
}

//displaytimes(title: title, time: time)
//addtimes(titleadd: titleadd),
class displaytimes extends StatelessWidget {
  const displaytimes({
    super.key,
    required this.title,
    required this.time,
  });

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class addtimes extends StatelessWidget {
  const addtimes({
    super.key,
    required this.titleadd,
  });

  final String titleadd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 9),
        const clockimg(),
        const SizedBox(width: 5),
        Text(
          titleadd,
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
