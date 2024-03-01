import 'package:flutter/material.dart';
import '../Introduction/Timepop/TotalPreppTimepop.dart';

class TotalTimeDialog {
  static void addTotalTime(
    Function(String) addTotalTime,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            addTotalTime: addTotalTime,
            isTotaltime: true,
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
    Function(String) addTotalTime,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            addTotalTime: addTotalTime,
            isPreppTime: true,
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
