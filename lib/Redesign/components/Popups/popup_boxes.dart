import 'package:flutter/material.dart';
import 'popup_components.dart';
import '../styles/style.dart';
import '../styles/style_objects.dart';
import 'textfields.dart';

//Detta är ingridnetbox save
//on save text controller
//text field controller sen on save return Mydata(thetext: mycontroller.text)
// add items.list mycontroller.text

///Next up

//detta är lådan för titel,steptitle
class SmallTextfieldPop extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  const SmallTextfieldPop({
    required this.labelText,
    this.hintText = '',
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Utils.smallpopbox(
      Card(
        color: StyleUtils.cardcolorgrey(),
        child: Stack(
          children: [
            Titles(title: title),
            Smalltextfield(
              labelText: labelText,
              hintText: hintText,
            ),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}

//detta är lådan för lägga till description

//detta är lådan för spara steps
class Popsteps extends StatelessWidget {
  final String title;
  const Popsteps({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Utils.stepspopbox(
      Card(
        color: const Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Titles(title: title),
            const Stepstextfield(
              labeltext: 'Add a step',
            ),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}
