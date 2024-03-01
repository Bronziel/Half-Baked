import 'package:flutter/material.dart';
import 'create_tiles/create_portion_tile.dart';
import 'package:fb2/Redesign/components/styles/uifixedtimecard.dart';
import 'package:fb2/Redesign/CreateRecipeParts/Dialog/buttons_dialog/buttons.dart';
import '../Dialog/Time_dialog.dart';
import '../Introduction/create_title.dart';

//      ? () => DialogUtils.showTimePrepDialog(context)
//      : () => DialogUtils.showTimeTotalDialog(context),
class TimePrepTotalHandler extends StatelessWidget {
  const TimePrepTotalHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PortionSizeCardHandler(),
        SizedBox(
          height: 5,
        ),
        TimeCardHanlder()
      ],
    );
  }
}

class TimeCardHanlder extends StatefulWidget {
  const TimeCardHanlder({super.key});

  @override
  State<TimeCardHanlder> createState() => _TimeCardHanlderState();
}

class _TimeCardHanlderState extends State<TimeCardHanlder> {
  String? totalTime;
  String? prepTime;
  void updateTotaltime(String newTotalTime) {
    setState(() {
      totalTime = newTotalTime;
    });
  }

  void updatePrepTime(String newPrepTime) {
    setState(() {
      prepTime = newPrepTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 290,
          height: 50,
          child: Card(
            color: const Color(0xffd9d9d9),
            child: totalTime == null
                ? Addtimes2(
                    titleadd: 'Total Time:',
                    onPressed: () =>
                        TotalTimeDialog.addTotalTime(updateTotaltime, context),
                  )
                : Displaytimes2(
                    time: totalTime!,
                    title: 'Total time:',
                    editText: () => TotalTimeDialog.editTotalTime(
                        updateTotaltime, totalTime!, context)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 290,
          height: 50,
          child: Card(
            color: const Color(0xffd9d9d9),
            child: prepTime == null
                ? Addtimes2(
                    onPressed: () =>
                        PreppTimeDialog.addPreppTime(updatePrepTime, context),
                    titleadd: 'Prepp Time:',
                  )
                : Displaytimes2(
                    time: prepTime!,
                    title: 'Prepp Time',
                    editText: () => PreppTimeDialog.editPreppTime(
                        updatePrepTime, prepTime!, context)),
          ),
        ),
      ],
    );
  }
}

class PortionSizeCardHandler extends StatefulWidget {
  const PortionSizeCardHandler({super.key});

  @override
  State<PortionSizeCardHandler> createState() => _PortionSizeCardHandlerState();
}

class _PortionSizeCardHandlerState extends State<PortionSizeCardHandler> {
  String? portionSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: portionSize == null
            ? Addportion()
            : Displayportion(portion: portionSize!),
      ),
    );
  }
}

class Addtimes2 extends StatelessWidget {
  final VoidCallback onPressed;

  final String titleadd;
  const Addtimes2({
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

class Displaytimes2 extends StatelessWidget {
  final String title;
  final String time;
  final VoidCallback editText;
  const Displaytimes2({
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
