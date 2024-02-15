import 'package:flutter/material.dart';
import 'tiletest.dart';
import 'takedata.dart';

class ListOfIngtest extends StatefulWidget {
  const ListOfIngtest({super.key});

  @override
  State<ListOfIngtest> createState() => _ListOfIngState();
}

class _ListOfIngState extends State<ListOfIngtest> {
  late List<Itemtest> addTo = [];
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(items.length, (index) {
        Itemtest item = items[index];
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
          final Itemtest item = items.removeAt(oldIndex);

          items.insert(newIndex, item);
        });
      },
    );
  }
}
