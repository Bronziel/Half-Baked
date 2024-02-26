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
                label: "Kebabkött",
                amount: "500",
                unit: "ml",
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white, // Set your desired color here
                ),
              ),

              IngredientTile(
                label: "Kebabkött",
                amount: "500",
                unit: "ml",
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white, // Set your desired color here
                ),
              ),

              // Add more children as needed
            ],
          ),
        ),
      ],
    );
  }
}
