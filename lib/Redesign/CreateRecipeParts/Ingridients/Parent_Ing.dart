import 'package:flutter/material.dart';
import 'Tiles/ing_add_tile.dart';
import 'Ingridientlist/list_of_ing.dart';
import 'classIng/ing_class2.dart';
import 'Tiles/createmaintile.dart';

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
      //set new state for ing here when item added to renew list state.
    });
  }

  void editItem() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Createmaintitle(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000), // Set your desired color here
          ),
        ), //controls wich main tile size.we get since false we get the bigger one
        Addinngtile(addItemCallback: addItem), //tile to add new ingridninets
        Expanded(
          child: ListOfIng(addItem: addItem), //specila list for ingridinets
        ),
      ],
    );
  }
}
