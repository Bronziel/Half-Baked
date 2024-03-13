import 'package:flutter/material.dart';
import '../../../components/styles/uifixedtimecard.dart';

//displaytimes(title: title, time: time)
//addtimes(titleadd: titleadd),
class Displaytimesnow extends StatelessWidget {
  const Displaytimesnow({
    super.key,
    required this.title,
    required this.time,
  });

  final String title;
  final String time;

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
            const Clockimg(),
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
