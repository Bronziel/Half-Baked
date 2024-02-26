import 'createdescription.dart';
import 'createmytitle.dart';
import 'holder_prep_toal.dart';

import 'package:flutter/material.dart';

class Createintro extends StatelessWidget {
  const Createintro({
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
            Titleholder(showtitle: false),
            //description big box
            Descirptionholder(showObject1: false),
            SizedBox(
              height: 10,
            ),
            PortionPrepTotalHolder(),
          ],
        ),
      ),
    );
  }
}
