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
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(_items.length, (index) {
        Item item = _items[index];
        return IngredientTile(
          key: ValueKey(item.label),
          label: item.label,
          amount: item.amount,
          unit: item.unit,
          index: index,
          shownormal: false,
        );
      }),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final Item item = _items.removeAt(oldIndex);

          _items.insert(newIndex, item);
        });
      },
    );
  }
}

class Item {
  final String label;
  final String amount;
  final String unit;

  Item({required this.label, required this.amount, required this.unit});
}

final List<Item> _items = [
  Item(label: 'maricha sås', amount: '300', unit: 'ml'),
  Item(label: 'Jordgubbssylt', amount: '4', unit: 'dl'),
  Item(label: 'Kebabkött', amount: '400', unit: 'g'),
  Item(label: 'vitlöksås', amount: '1', unit: 'l'),
  Item(label: 'vitlök', amount: '2', unit: 'st'),
  Item(label: 'gullök', amount: '2000', unit: 'tsk'),
  Item(label: 'honung', amount: '1000', unit: 'ml'),
  Item(label: 'socker', amount: '2000', unit: 'tsk'),
  Item(label: 'mjölk', amount: '1000', unit: 'ml'),
  Item(label: 'Bröd', amount: '2000', unit: 'tsk'),
  Item(label: 'Fetaost', amount: '1000', unit: 'ml'),
  Item(label: 'Ketchup', amount: '2000', unit: 'tsk'),
  // ... more items
];
