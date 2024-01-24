import 'package:flutter/material.dart';
import '../../components/styles/textstyle.dart';
import '../../components/styles/colors.dart';

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
        SizedBox(
          width: 50,
        ),
        Showmycolors()
      ],
    );
  }
}

class Showmycolors extends StatelessWidget {
  const Showmycolors({super.key});

  @override
  Widget build(BuildContext context) {
    // List of color methods from the Paint class
    final colors = [
      Paint.blacks,
      Paint.greys,
      Paint.mainncolor,
      Paint.whites,
    ];

    // Generating Card widgets dynamically
    return Column(
      children: colors
          .map((colorMethod) => cardbox(Card(color: colorMethod())))
          .toList(),
    );
  }

  static SizedBox cardbox(Widget child) {
    return SizedBox(
      width: 100,
      height: 100,
      child: child,
    );
  }
}

class Poptextview extends StatelessWidget {
  const Poptextview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Paint.greys(),
      child: Column(
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
      ),
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
        Container(
          color: Paint.blacks(),
          padding: const EdgeInsets.all(8),
          child: Text(
            'Title',
            style: StyleTextRecipe.titelrecipe(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Paint.blacks(),
          child: Text(
            'Description. en smaskig gebarulle',
            style: StyleTextRecipe.descriptionrecipe(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Paint.greys(),
          child: Text(
            'Total/prep time and portionsize prep time 10 mins',
            style: StyleTextRecipe.porttotalrecipe(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Paint.greys(),
          child: Text(
            'titel ing Ingriediants',
            style: StyleTextRecipe.ingboxtitel(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: const Color(0xff161414),
          child: Text(
            'ing Kebarulle 100g',
            style: StyleTextRecipe.ingbox(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Paint.greys(),
          child: Text(
            '1',
            style: StyleTextRecipe.stepsnumber(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Paint.greys(),
          child: Text(
            'Steps text: kasta in kycklingne i ugnen.',
            style: StyleTextRecipe.stepstext(),
          ),
        ),
      ],
    );
  }
}
