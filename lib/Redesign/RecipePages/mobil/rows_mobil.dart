import 'package:flutter/material.dart';

import '../../components/currents/imgholders/normal/image_boxes.dart';
import '../../components/currents/stepholder/prog_ui.dart';
import '../../components/styles/ingboxshared.dart';
import '../../components/styles/spacing/sizedboxes.dart';
import '../normal_intro/introduction_box.dart';

class NewDesignPageMobil extends StatelessWidget {
  const NewDesignPageMobil({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidgetMobil(),
              Height20StandardWidget(),
              SecondRowWidgetMobil(),
            ],
          ),
        ),
      
    );
  }
}


class FirstRowWidgetMobil extends StatelessWidget {
  const FirstRowWidgetMobil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Height40StandardWidget(),
        Intro(),
        Height20StandardWidget(),
        Carousell(smallCarousellImagesBottomLeft: false,sideColumn: false,)
      ],
    );
  }
}

class SecondRowWidgetMobil extends StatelessWidget {
  const SecondRowWidgetMobil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Height40StandardWidget(),
        RecipeListCard(other: true),
        Height20StandardWidget(),
        Builtbyme(),
      ],
    );
  }
}