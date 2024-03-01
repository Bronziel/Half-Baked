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
            dataSender: addTotalTime,
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

  static void editTotalTime(
    Function(String) addTotalTime,
    String intialText,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            initalText: intialText,
            dataSender: addTotalTime,
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
    Function(String) addPreppTime,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            dataSender: addPreppTime,
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

  static void editPreppTime(
    Function(String) addPreppTime,
    String intialText,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: TimePopupp(
            initalText: intialText,
            dataSender: addPreppTime,
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

class PortionsizeDialog {}
