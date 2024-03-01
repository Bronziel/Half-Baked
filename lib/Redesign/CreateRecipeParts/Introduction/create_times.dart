import 'package:flutter/material.dart';
import '../Dialog/Time_dialog.dart';
import 'create_tiles/TimePrepPortion.dart';

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
            child: prepTime == null
                ? Addtimes(
                    onPressed: () =>
                        PreppTimeDialog.addPreppTime(updatePrepTime, context),
                    titleadd: 'Prepp Time:',
                  )
                : Displaytimes(
                    time: prepTime!,
                    title: 'Prepp Time',
                    editText: () => PreppTimeDialog.editPreppTime(
                        updatePrepTime, prepTime!, context)),
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
            child: totalTime == null
                ? Addtimes(
                    titleadd: 'Total Time:',
                    onPressed: () =>
                        TotalTimeDialog.addTotalTime(updateTotaltime, context),
                  )
                : Displaytimes(
                    time: totalTime!,
                    title: 'Total time:',
                    editText: () => TotalTimeDialog.editTotalTime(
                        updateTotaltime, totalTime!, context)),
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
  void updatePortionSize(String newPortionSize) {
    setState(() {
      portionSize = newPortionSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: portionSize == null
            ? Addportion(
                onPressed: () => PortionsizeDialog.addPortionSize(
                    updatePortionSize, context),
              )
            : Displayportion(
                portion: portionSize!,
                onPressed: () => PortionsizeDialog.editPortionSize(
                    updatePortionSize, portionSize!, context),
              ),
      ),
    );
  }
}
