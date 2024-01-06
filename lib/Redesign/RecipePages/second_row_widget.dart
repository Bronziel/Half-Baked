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
        SizedBox(
          width: 1175,
          height: 474,
          child: Card(),
        )
      ],
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
        color: Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ListView(
            children: <Widget>[
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
