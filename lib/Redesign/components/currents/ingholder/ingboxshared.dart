import 'package:flutter/material.dart';

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
                    IngredientTile(
                      label: "Kebabkött",
                      quantity: "500",
                      unit: "ml",
                    ),

                    IngredientTile(
                      label: "Kebabkött",
                      quantity: "500",
                      unit: "ml",
                    ),

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

class IngredientTile extends StatelessWidget {
  final String label; // First parameter
  final String quantity; // Second parameter
  final String unit; // Third parameter

  // Update the constructor to accept three parameters
  const IngredientTile({
    super.key,
    required this.label,
    required this.quantity,
    required this.unit,
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
      child: Row(
        // Removed const since we are using dynamic values now
        children: [
          const SizedBox(width: 16),
          Text(label, style: textStyle), // Use the label parameter
          const Text(':', style: textStyle),
          const SizedBox(width: 20),
          Text(quantity, style: textStyle), // Use the quantity parameter
          const SizedBox(width: 3),
          Text(unit, style: textStyle), // Use the unit parameter
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
