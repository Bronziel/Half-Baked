import 'package:flutter/material.dart';
import '../../Ingridients/Ingridientpops/textfield_ing.dart';
import '../../../components/Popups/popup_components.dart';
import '../../../components/styles/style_objects.dart';

class TimePopupp extends StatefulWidget {
  //totaltime
  final String title;
  final String labelText;
  final String hintText;
  final bool isPortionSize;
  final bool isTotaltime;
  final bool isPreppTime;
  //preptime

  //portionsize
  const TimePopupp({
    required this.isPortionSize,
    this.isPreppTime = false,
    this.isTotaltime = false,
    //totaltime
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
                isPortionSize: widget.isPortionSize,
                labelText: widget.labelText,
                hintText: widget.hintText),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}
