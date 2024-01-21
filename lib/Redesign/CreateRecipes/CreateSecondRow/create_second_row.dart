import 'package:flutter/material.dart';
import '../../components/sizedboxes.dart';
import '../../Testin_components/building/building.dart';
import 'CreateSteps.dart';
import 'Createingfield.dart';

class CreateSecondRowWidget extends StatelessWidget {
  const CreateSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        CreateRecipeListCard2(),
        Width20StandardWidget(),
        Steps(),
      ],
    );
  }
}
