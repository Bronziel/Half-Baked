import 'package:flutter/material.dart';

import 'title_holder.dart';
import 'holder_prep_toal.dart';
import 'description_holder.dart';

class CreateIntroductionWidget extends StatelessWidget {
  const CreateIntroductionWidget({
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
            Titelholder(),
            //description big box
            Descriptionholder(),
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