import 'package:flutter/material.dart';
import '../components/styles/spacing/sizedboxes.dart';
import '../styles_test/appbar.dart';
import '../components/currents/imgholders/image_create_hold/create_image_boxes.dart';
import '../components/currents/stepholder/create_step/CreateSteps.dart';
import '../components/styles/ingboxshared.dart';
import '../CreateRecipeParts/Introduction/create_intro.dart';

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
        Createintro(),
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
