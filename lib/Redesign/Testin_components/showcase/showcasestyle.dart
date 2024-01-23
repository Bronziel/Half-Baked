import 'package:flutter/material.dart';
import '../../components/styles/textstyle.dart';

class Styleshowcasepage extends StatelessWidget {
  const Styleshowcasepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(
          children: [
            Textviews(),
          ],
        ),
      )),
    );
  }
}

class Textviews extends StatelessWidget {
  const Textviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Recipetextview(),
        SizedBox(
          width: 50,
        ),
        Poptextview(),
      ],
    );
  }
}

class Poptextview extends StatelessWidget {
  const Poptextview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'pop Title: titel portionsize, prep time , total time',
          style: TextPopStyle.poptitle(),
        ),
        Text(
          'Texten som är i textfiel först labeltext.',
          style: TextPopStyle.labelstylepop(),
        ),
        Text(
          'text som skriv i popuptextfield',
          style: TextPopStyle.poptextfield(),
        ),
        Text(
          'text som är som hint åt texten',
          style: TextPopStyle.pophinttext(),
        ),
      ],
    );
  }
}

class Recipetextview extends StatelessWidget {
  const Recipetextview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Text(
            'Title',
            style: StyleTextRecipe.titelrecipe(),
          ),
        ),
        Text(
          'Description. en smaskig gebarulle',
          style: StyleTextRecipe.descriptionrecipe(),
        ),
        Text(
          'Total/prep time and portionsize prep time 10 mins',
          style: StyleTextRecipe.porttotalrecipe(),
        ),
        Text(
          'titel ing Ingriediants',
          style: StyleTextRecipe.ingboxtitel(),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: const Color(0xff161414),
          child: Text(
            'ing Kebarulle 100g',
            style: StyleTextRecipe.ingbox(),
          ),
        ),
        Text(
          '1',
          style: StyleTextRecipe.stepsnumber(),
        ),
        Text(
          'Steps text: kasta in kycklingne i ugnen.',
          style: StyleTextRecipe.stepstext(),
        ),
      ],
    );
  }
}
