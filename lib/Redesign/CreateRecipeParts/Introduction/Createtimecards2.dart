import 'package:flutter/material.dart';
import '../../components/currents/cards/fixedtimecard.dart';
import '../../components/currents/buttons.dart';
import '../../components/Popups/popupclass.dart';

class TimeCard extends StatelessWidget {
  final String title;
  final String time;
  final String titleadd;
  final bool showdisplaytime;
  final bool prepOrTotal;

  const TimeCard({
    required this.showdisplaytime,
    required this.prepOrTotal,
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
    return Displaytimes(title: title, time: time);
  }

  Widget addtime() {
    return Addtimes(
      titleadd: titleadd,
      preptot: prepOrTotal,
    );
  }
}

//displaytimes(title: title, time: time)
//addtimes(titleadd: titleadd),
class Displaytimes extends StatelessWidget {
  const Displaytimes({
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
    );
  }
}

class Addtimes extends StatelessWidget {
  final bool preptot;
  const Addtimes({
    super.key,
    required this.titleadd,
    required this.preptot,
  });

  final String titleadd;

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
          onPressed: preptot
              ? () => DialogUtils.showTimePrepDialog(context)
              : () => DialogUtils.showTimeTotalDialog(context),
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
