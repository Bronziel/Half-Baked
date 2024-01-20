import 'package:flutter/material.dart';
import '../components/sizedboxes.dart';
import '../Testin_components/building/building.dart';

class CreateSecondRowWidget extends StatelessWidget {
  const CreateSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        CreateRecipeListCard2(),
        Width20StandardWidget(),
        Steps(),
      ],
    );
  }
}

class Steps extends StatelessWidget {
  const Steps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      //width: 1200,
      width: 1110,
      height: 450,
      child: Card(
        color: Color(0xffd9d9d9),
      ),
    );
  }
}

//'Description:'
//required this.title,
//final String title;
//Titles(title: title),

/*class MyListTile extends StatefulWidget {
  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool isChecked = false; // initial state of the checkbox

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '1',
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 40,
          color: Color(0xFF0922FD),
        ),
      ),
      title: Text(
        'Börja med att slå sönder 3 ägg. Vispa Sedan ihop äggen i en bunke',
        style: TextStyle(
          fontFamily: 'Paprika',
          fontSize: 24,
          color: Color(0xFF000000),
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            isChecked = newValue ?? false;
          });
        },
      ),
    );
  }
} */




