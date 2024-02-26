import 'package:flutter/material.dart';
import '../descriptionshared.dart';
import '../../sharedtitle.dart';
import '../../cards/sharedcard.dart';

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
            Titleholder(showtitle: true),
            Descirptionholder(showObject1: true),
            IcontilesBox(),
          ],
        ),
      ),
    );
  }
}
