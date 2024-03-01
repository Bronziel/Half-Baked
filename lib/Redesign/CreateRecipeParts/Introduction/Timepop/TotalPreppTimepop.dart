import 'package:flutter/material.dart';
import '../../Ingridients/Ingridientpops/textfield_ing.dart';
import '../../../components/Popups/popup_components.dart';
import '../../../components/styles/style_objects.dart';

class TimePopupp extends StatefulWidget {
  //totaltime
  final Function(String) addTotalTime;
  final String title;
  final String labelText;
  final String hintText;
  final bool isTotaltime;
  final bool isPreppTime;
  //preptime

  //portionsize
  const TimePopupp({
    this.isPreppTime = false,
    this.isTotaltime = false,
    //totaltime
    required this.addTotalTime,
    required this.title,
    required this.labelText,
    required this.hintText,
    //preptime
    //portionsize
    super.key,
  });

  @override
  State<TimePopupp> createState() => _TimePopuppState();
}

class _TimePopuppState extends State<TimePopupp> {
  String? errorText1;
  late TextEditingController timeController;
  @override
  void initState() {
    super.initState();
    timeController = TextEditingController();
  }

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  void saveTime() {
    setState(() {
      errorText1 = timeController.text.isEmpty ? 'Field cannot be empty' : null;
    });
    if (errorText1 == null) {
      widget.addTotalTime(timeController.text);
      timeController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Utils.smallpopbox(
      Card(
        color: const Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Titles(title: widget.title),
            NumberTextField(
                errorText2: errorText1,
                numberController: timeController,
                labelText: widget.labelText,
                hintText: widget.hintText),
            const PostionedStopButton(),
            //three diffrent save methods depending on what they came with.
            SaveButtonIng(
              onPressed: saveTime,
            ),
          ],
        ),
      ),
    );
  }
}
