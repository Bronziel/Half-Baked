import 'package:flutter/material.dart';
import '../../components/spacing/sizedboxes.dart';

import 'stepsholder/CreateSteps.dart';
import 'ingridientholder/Createingfield.dart';

class CreateSecondRowWidget extends StatelessWidget {
  const CreateSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        CreateRecipeListCard(),
        Width20StandardWidget(),
        Steps(),
      ],
    );
  }
}
