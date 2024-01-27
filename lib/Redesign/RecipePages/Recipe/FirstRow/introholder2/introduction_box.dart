import 'package:flutter/material.dart';
import '../../../../components/currents/introductionholder/descriptionshared.dart';
import '../../../../components/currents/sharedtitle.dart';
import '../../../../components/currents/cards/sharedcard.dart';
import '../../../../CreateRecipes/CreateFirstRow/introductionholder/holder_prep_toal.dart';

class IntroductionWidget extends StatelessWidget {
  final bool showIntrodisplay;
  const IntroductionWidget({
    required this.showIntrodisplay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 410,
      child: Card(
        color: const Color(0xFF161414),
        child: showIntrodisplay ? introdisplay() : createintrodisplay(),
      ),
    );
  }

  Widget introdisplay() {
    return const Intro();
  }

  Widget createintrodisplay() {
    return const Createintro();
  }
}

class Intro extends StatelessWidget {
  const Intro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Titleholder(showtitle: true),
        Descirptionholder(showObject1: true),
        IcontilesBox(),
      ],
    );
  }
}

class Createintro extends StatelessWidget {
  const Createintro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Titleholder(showtitle: false),
        //description big box
        Descirptionholder(showObject1: false),
        SizedBox(
          height: 10,
        ),
        PortionPrepTotalHolder(),
      ],
    );
  }
}
