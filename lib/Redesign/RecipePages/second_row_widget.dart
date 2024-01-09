import 'package:flutter/material.dart';

import 'ComponentsRedesign.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        RecipeListCard(),
        Width20StandardWidget(),
        Stepswidget()
      ],
    );
  }
}

class Stepswidget extends StatelessWidget {
  const Stepswidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 1200,
      height: 474,
      child: Card(
        color: Color(0xffd9d9d9),
        child: Row(
          children: [
            SizedBox(
              height: 320,
              width: 570,
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      '1',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Color(0xFF0922FD)),
                    ),
                    title: Text(
                      'Börja med att slå sönder 3 ägg. Vispa Sedan ihop äggen i en bunke',
                      style: TextStyle(
                          fontFamily: 'Paprika',
                          fontSize: 24,
                          color: Color(0xFF000000)),
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Color(0xFFFFFFFF),
              indent: 20,
              width: 40,
              endIndent: 20,
            ),
            SizedBox(
              height: 320,
              width: 570,
              child: Column(
                children: [
                  ListTile(
                    leading: Text('1'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeListCard extends StatelessWidget {
  const RecipeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410,
      height: 463,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              const IngMainTile(),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    // Add more children as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngridientTile extends StatelessWidget {
  const IngridientTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white, // Set your desired color here
    );

    return Container(
      height: 50,
      width: 410,
      color: const Color(0xff161414),
      child: const Row(
        children: [
          SizedBox(width: 16),
          Text("Kebabkött:", style: textStyle),
          SizedBox(width: 20),
          Text("500", style: textStyle),
          SizedBox(width: 3),
          Text("ml", style: textStyle),
        ],
      ),
    );
  }
}

class IngMainTile extends StatelessWidget {
  const IngMainTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF000000), // Set your desired color here
    );

    return Container(
      height: 50,
      width: 410,
      color: const Color(0xFFD9D9D9),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Image.asset('images/new/icons/cart.png'),
          const SizedBox(width: 82),
          const Text("Ingridients", style: textStyle),
          const SizedBox(width: 82),
          Image.asset('images/new/icons/cart.png'),
        ],
      ),
    );
  }
}
