import 'package:flutter/material.dart';
import '../../components/spacing/sizedboxes.dart';
import '../../components/currents/ingholder/ingboxshared.dart';
import '../../components/currents/stepholder/prog_ui.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        RecipeListCard(other: true),
        Width20StandardWidget(),
        Builtbyme(),
      ],
    );
  }
}


//byg step först 