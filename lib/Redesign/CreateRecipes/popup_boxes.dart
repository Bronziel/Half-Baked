import 'package:flutter/material.dart';
import 'create_second_row.dart';
import 'popup_components.dart';
import 'style.dart';
import 'style_objects.dart';
import 'textfields.dart';

//Detta är ingridnetbox save
class IngPop extends StatelessWidget {
  final String title;

  final String labelText;
  final String labelText2;
  final String labelText3;
  final String hintText;
  final String hintText2;
  final String hintText3;
  final bool isPortionSize;

  const IngPop({
    required this.labelText,
    required this.labelText2,
    required this.labelText3,
    this.hintText = '',
    this.hintText2 = '',
    this.hintText3 = '',
    required this.title,
    this.isPortionSize = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Utils.ingpop(
      Card(
        color: StyleUtils.cardcolorgrey(),
        child: Stack(
          children: [
            Titles(title: title),
            Smalltextfield(
              labelText: labelText,
              hintText: hintText,
              bottom: 160,
            ),
            Numberonlytextfiel(
              isPortionSize: false,
              labelText: labelText2,
              hintText: hintText2,
              bottom: 85,
            ),
            //85
            Smalltextfield(
              labelText: labelText3,
              hintText: hintText3,
            ),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}

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

//lådan för prep/total time o portionsize
class PopTimePort extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  final bool isPortionSize;

  const PopTimePort({
    super.key,
    required this.title,
    required this.labelText,
    this.hintText = '',
    this.isPortionSize = false,
  });

  @override
  Widget build(BuildContext context) {
    return Utils.smallpopbox(
      Card(
        color: const Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Titles(title: title),
            Numberonlytextfiel(
                isPortionSize: isPortionSize,
                labelText: labelText,
                hintText: hintText),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}

//detta är lådan för lägga till description
class PopDescription extends StatelessWidget {
  final String title;
  const PopDescription({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Utils.bigpopbox(
      Card(
        color: const Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Titles(title: title),
            const Descriptiontextfield(
              labeltext: 'Add a Description',
            ),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}

class Descriptiontextfield extends StatelessWidget {
  final String labeltext;
  const Descriptiontextfield({
    required this.labeltext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      top: 45,
      right: 100, // Adjusted to ensure the TextField is more square-like
      child: TextField(
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: StyleUtils.labelstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
        maxLines: null, // Allows for unlimited lines
        minLines: 5, // Set this to a desired initial size
      ),
    );
  }
}

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

//detta är lådan för titel,steptitle
class IngamountfieldPop extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  const IngamountfieldPop({
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
            Dropfield(
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

class Dropfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double bottom;
  const Dropfield({
    required this.labelText,
    this.hintText = '',
    this.bottom = 10,
    //10
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Set the position for the TextField
      bottom: bottom, // Adjust these values as needed
      left: 10, // Adjust these values as needed
      right: 100,

      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: StyleUtils.labelstylepop(),
          hintText: hintText,
          hintStyle: StyleUtils.hintstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
      ),
    );
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}
