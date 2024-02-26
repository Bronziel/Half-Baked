import 'package:fb2/Redesign/components/Popups/popupclass.dart';
import 'package:flutter/material.dart';
import '../classIng/ing_class2.dart';
import '../Tiles/Normaltile.dart';

class ListOfIng extends StatefulWidget {
  final Function(String, String, String) addItem;
  const ListOfIng({
    required this.addItem,
    super.key,
  });

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

  void replaceItem(int index, String title, String amount, String unit) {
    setState(() {
      print('replace??');
      // Check if the index is within the bounds of the list
      if (index >= 0 && index < ingredients.length) {
        // Replace the item at the given index with a new object
        ingredients[index] =
            Ingredients(label: title, amount: amount, unit: unit);
      } else {
        print("Index out of bounds");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(ingredients.length, (index) {
        Ingredients item = ingredients[index];
        return CreateIngredientTile(
          key: ValueKey(item.label),
          label: item.label,
          amount: item.amount,
          unit: item.unit,
          index: index,
          shownormal: false,
          onPressedDelete: () => removeItem(index),
          onPressedEdit: () => DialogUtils.showIngPopDialogEdit(
              context,
              widget.addItem,
              index,
              item.label,
              item.amount,
              item.unit,
              replaceItem),

          //onpressed edit edititem(index)
          //FUNCTION FOR THE ON pressed
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
