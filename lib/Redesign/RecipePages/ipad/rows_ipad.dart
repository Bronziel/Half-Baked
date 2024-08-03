import 'package:fb2/Redesign/components/currents/stepholder/Progress.dart';
import 'package:flutter/material.dart';

import '../../components/currents/imgholders/normal/image_boxes.dart';
import '../../components/currents/stepholder/prog_ui.dart';
import '../../components/styles/ingboxshared.dart';
import '../../components/styles/spacing/sizedboxes.dart';
import '../base_recipe.dart';
import '../normal_intro/introduction_box.dart';
import 'steps_ipad.dart';

class NewDesignPageIpad extends StatelessWidget {
  const NewDesignPageIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidgetIpad(),
              Height20StandardWidget(),
              SecondRowWidgetIpad(),
            ],
          ),
        ),
      
    );
  }
}

class FirstRowWidgetIpad extends StatelessWidget {
  const FirstRowWidgetIpad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        Intro(),
        Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}

class SecondRowWidgetIpad extends StatelessWidget {
  const SecondRowWidgetIpad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        RecipeListCard(other: true),
        Width20StandardWidget(),
        Expanded(child: BuiltbymeIpad()),
      ],
    );
  }
}
