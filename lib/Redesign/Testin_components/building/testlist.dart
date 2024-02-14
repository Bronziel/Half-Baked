import 'package:flutter/material.dart';
import 'tiletest.dart';

class ListOfIngtest extends StatefulWidget {
  const ListOfIngtest({super.key});

  @override
  State<ListOfIngtest> createState() => _ListOfIngState();
}

class _ListOfIngState extends State<ListOfIngtest> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(_items.length, (index) {
        Itemtest item = _items[index];
        return IngredientTiletest(
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
          final Itemtest item = _items.removeAt(oldIndex);

          _items.insert(newIndex, item);
        });
      },
    );
  }
}

class Itemtest {
  final String label;
  final String amount;
  final String unit;

  Itemtest({required this.label, required this.amount, required this.unit});
}

final List<Itemtest> _items = [
  Itemtest(label: 'maricha sås', amount: '300', unit: 'ml'),
  Itemtest(label: 'Jordgubbssylt', amount: '4', unit: 'dl'),
  Itemtest(label: 'Kebabkött', amount: '400', unit: 'g'),
  Itemtest(label: 'vitlöksås', amount: '1', unit: 'l'),
  Itemtest(label: 'vitlök', amount: '2', unit: 'st'),
  Itemtest(label: 'gullök', amount: '2000', unit: 'tsk'),
  Itemtest(label: 'honung', amount: '1000', unit: 'ml'),
  Itemtest(label: 'socker', amount: '2000', unit: 'tsk'),
  Itemtest(label: 'mjölk', amount: '1000', unit: 'ml'),
  Itemtest(label: 'Bröd', amount: '2000', unit: 'tsk'),
  Itemtest(label: 'Fetaost', amount: '1000', unit: 'ml'),
  Itemtest(label: 'Ketchup', amount: '2000', unit: 'tsk'),
  // ... more items
];
