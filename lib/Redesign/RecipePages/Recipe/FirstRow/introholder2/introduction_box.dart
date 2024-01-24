import 'package:flutter/material.dart';
import '../../../../components/currents/introductionholder/descriptionshared.dart';
import '../../../../components/currents/sharedtitle.dart';
import '../../../../components/currents/cards/sharedcard.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
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
            Titleholder(showtitle: true),
            Descirptionholder(showObject1: true),
            IcontilesBox(),
          ],
        ),
      ),
    );
  }
}
