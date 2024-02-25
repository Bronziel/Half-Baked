import 'package:flutter/material.dart';
import '../../components/spacing/sizedboxes.dart';
import '../../styles_test/appbar.dart';
import '../../components/spacing/sizedboxes.dart';
import '../../components/currents/imgholders/image_create_hold/create_image_boxes.dart';
import '../../components/currents/introductionholder/normal_intro/introduction_box.dart';
import '../../components/spacing/sizedboxes.dart';
import '../../components/currents/stepholder/create_step/CreateSteps.dart';
import '../../components/currents/ingholder/ingboxshared.dart';

class CreateRecipesPage extends StatelessWidget {
  const CreateRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: NewAppbar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              CreateFirstRowWidget(),
              Height20StandardWidget(),
              CreateSecondRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateFirstRowWidget extends StatelessWidget {
  const CreateFirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        IntroductionWidget(showIntrodisplay: false),
        Width20StandardWidget(),
        CreateMainImagePlusBoxes(),
      ],
    );
  }
}

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
