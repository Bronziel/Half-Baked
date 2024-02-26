import 'package:flutter/material.dart';
import 'ingtile.dart';
import 'maintile.dart';
import '../../Popups/popupclass.dart';

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
                shownormal: true,
              ),

              IngredientTile(
                label: "Kebabkött",
                amount: "500",
                unit: "ml",
                shownormal: true,
              ),

              // Add more children as needed
            ],
          ),
        ),
      ],
    );
  }
}
