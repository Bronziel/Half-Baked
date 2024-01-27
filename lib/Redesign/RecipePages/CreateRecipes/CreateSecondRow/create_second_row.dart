import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';

import 'stepsholder/CreateSteps.dart';
import '../../../components/currents/ingholder/ingboxshared.dart';

class CreateSecondRowWidget extends StatelessWidget {
  const CreateSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        RecipeListCard(other: false),
        Width20StandardWidget(),
        Steps(),
      ],
    );
  }
}
