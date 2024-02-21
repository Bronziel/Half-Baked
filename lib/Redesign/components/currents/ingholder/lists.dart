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

//create list and reorder

class ListOfIng extends StatefulWidget {
  const ListOfIng({super.key});

  @override
  State<ListOfIng> createState() => _ListOfIngState();
}

class _ListOfIngState extends State<ListOfIng> {
  void removeItem(int index) {
    setState(() {
      ingredients.removeAt(index);
      print('fuka?');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(ingredients.length, (index) {
        Ingredients item = ingredients[index];
        return IngredientTile(
          key: ValueKey(item.label),
          label: item.label,
          amount: item.amount,
          unit: item.unit,
          index: index,
          shownormal: false,
          onPressed: () => removeItem(index),
        );
      }),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final Ingredients item = ingredients.removeAt(oldIndex);

          ingredients.insert(newIndex, item);
        });
      },
    );
  }
}

class Ingredients {
  final String label;
  final String amount;
  final String unit;

  Ingredients({required this.label, required this.amount, required this.unit});
}

final List<Ingredients> ingredients = [
  Ingredients(label: 'maricha sås', amount: '300', unit: 'ml'),
  Ingredients(label: 'Jordgubbssylt', amount: '4', unit: 'dl'),
  Ingredients(label: 'Kebabkött', amount: '400', unit: 'g'),
  Ingredients(label: 'vitlöksås', amount: '1', unit: 'l'),
  Ingredients(label: 'vitlök', amount: '2', unit: 'st'),
  Ingredients(label: 'gullök', amount: '2000', unit: 'tsk'),
  Ingredients(label: 'honung', amount: '1000', unit: 'ml'),
  Ingredients(label: 'socker', amount: '2000', unit: 'tsk'),
  Ingredients(label: 'mjölk', amount: '1000', unit: 'ml'),
  Ingredients(label: 'Bröd', amount: '2000', unit: 'tsk'),
  Ingredients(label: 'Fetaost', amount: '1000', unit: 'ml'),
  Ingredients(label: 'Ketchup', amount: '2000', unit: 'tsk'),
  // ... more items
];
