import 'package:flutter/material.dart';
import '../Introduction/Timepop/TotalPreppTimepop.dart';

class TotalTimeDialog {
  static void addTotalTime(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            isTotaltime: true,
            isPortionSize: false,
            title: 'TotalTime:',
            labelText: 'Add Total time',
            hintText:
                'Total time in minutes', // Used to set the keyboard type to text
          ),
        );
      },
    );
  }
}

class PreppTimeDialog {
  static void addPreppTime(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            isPreppTime: true,
            isPortionSize: false,
            title: 'PrepTime:',
            labelText: 'Add Preperation time',
            hintText:
                'preparation time in minutes', // Used to set the keyboard type to text
          ),
        );
      },
    );
  }
}
