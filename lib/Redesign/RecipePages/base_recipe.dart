import 'package:flutter/material.dart';
import '../components/styles/spacing/sizedboxes.dart';
import '../styles_test/appbar.dart';
import '../components/currents/introductionholder/normal_intro/introduction_box.dart';
import '../components/currents/imgholders/normal/image_boxes.dart';
import '../components/currents/ingholder/ingboxshared.dart';
import '../components/currents/stepholder/prog_ui.dart';

class NewDesignPage extends StatelessWidget {
  const NewDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0), child: NewAppbar()),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidget(),
              Height20StandardWidget(),
              SecondRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        IntroductionWidget(showIntrodisplay: true),
        Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}

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
