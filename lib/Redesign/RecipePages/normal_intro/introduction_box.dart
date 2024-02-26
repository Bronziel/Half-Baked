import 'package:flutter/material.dart';
import '../../components/currents/introductionholder/descriptionshared.dart';
import '../../components/currents/cards/sharedcard.dart';
import 'titletileholds.dart';

class Intro extends StatelessWidget {
  const Intro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      width: 410,
      child: Card(
        color: Color(0xFF161414),
        child: Column(
          children: [
            DisplaynormalBasictitle(
              title: 'Kebabrulle',
            ),
            Descirptionholder(showObject1: true),
            IcontilesBox(),
          ],
        ),
      ),
    );
  }
}
