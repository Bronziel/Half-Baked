import 'package:flutter/material.dart';
import '../../components/styles/style_objects.dart';
import '../../components/styles/style.dart';
import '../../components/Popups/popup_components.dart';

import '../../components/currents/ingholder/lists.dart';
import '../../components/currents/ingholder/ing_add_tile.dart';
import '../../components/currents/ingholder/maintile.dart';
import '../../components/currents/ingholder/lists.dart';
import '../../components/Popups/textfield_ing.dart';

class CreateListWithIngridients extends StatefulWidget {
  const CreateListWithIngridients({super.key});

  @override
  State<CreateListWithIngridients> createState() =>
      _CreateListWithIngridientsState();
}

class _CreateListWithIngridientsState extends State<CreateListWithIngridients> {
  void addItem(String title, String amount, String unit) {
    setState(() {
      //parameter för sätta vilken info är vad items kräver mytext.vi säger hämta text från textfield
      ingredients.add(Ingredients(label: title, amount: amount, unit: unit));
      print('lagt till item');
      //set new state for ing here when item added to renew list state.
    });
  }

  void editItem() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IngMainTile(
            showMaintile:
                false), //controls wich main tile size.we get since false we get the bigger one
        Addinngtile(addItemCallback: addItem), //tile to add new ingridninets
        Expanded(
          child: ListOfIng(addItem: addItem), //specila list for ingridinets
        ),
      ],
    );
  }
}
