import 'package:flutter/material.dart';
import 'ingtile.dart';
import 'maintile.dart';

class Listnormal extends StatelessWidget {
  const Listnormal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IngMainTile(showMaintile: true),
        Expanded(
          child: ListView(
            children: const <Widget>[
              IngredientTile(
                shownormal: true,
                label: "Kebabkött",
                amount: "500",
                unit: "ml",
                index: 0,
              ),

              IngredientTile(
                shownormal: true,
                label: "Kebabkött",
                amount: "500",
                unit: "ml",
                index: 0,
              ),

              // Add more children as needed
            ],
          ),
        ),
      ],
    );
  }
}
