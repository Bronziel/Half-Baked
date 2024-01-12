import 'package:flutter/material.dart';

import '../../components/ComponentsRedesign.dart';
import '../../components/sizedboxes.dart';
import '../../components/sizedboxes.dart';

class CreateSecondRowWidget extends StatelessWidget {
  const CreateSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Widht40wallWidget(),
        CreateRecipeListCard(),
        const Width20StandardWidget(),
        steps(),
      ],
    );
  }
}

class steps extends StatelessWidget {
  const steps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200,
      height: 474,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: saveingridient(),
      ),
    );
  }
}

class saveingridient extends StatelessWidget {
  const saveingridient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 1000,
          height: 450,
          child: Card(
            color: Color(0xFF234567),
            child: Row(
              children: [
                Column(
                  children: [
                    Createingbox(),
                    Createambox(),
                    Createmessbox(),
                  ],
                ),
                Column(
                    //icon 1
                    //icon 2
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Createmessbox extends StatelessWidget {
  const Createmessbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 490,
          height: 200,
          child: Card(
            color: Color.fromARGB(255, 218, 143, 222),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Messurment:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MySegmentedControl(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MySegmentedControl extends StatefulWidget {
  @override
  _MySegmentedControlState createState() => _MySegmentedControlState();
}

class _MySegmentedControlState extends State<MySegmentedControl> {
  List<bool> isSelectedRow1 = [false, false, false];
  List<bool> isSelectedRow2 = [false, false, false, false];
  List<bool> isSelectedRow3 = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ToggleButtons(
          children: <Widget>[
            Text('msk'),
            Text('tsk'),
            Text('krm'),
          ],
          isSelected: isSelectedRow1,
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelectedRow1.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelectedRow1[buttonIndex] = true;
                } else {
                  isSelectedRow1[buttonIndex] = false;
                }
              }
            });
          },
        ),
        ToggleButtons(
          children: <Widget>[
            Text('ml'),
            Text('cl'),
            Text('dl'),
            Text('l'),
          ],
          isSelected: isSelectedRow2,
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelectedRow2.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelectedRow2[buttonIndex] = true;
                } else {
                  isSelectedRow2[buttonIndex] = false;
                }
              }
            });
          },
        ),
        ToggleButtons(
          children: <Widget>[
            Text('g'),
            Text('kg'),
            Text('hg'),
          ],
          isSelected: isSelectedRow3,
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelectedRow3.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelectedRow3[buttonIndex] = true;
                } else {
                  isSelectedRow3[buttonIndex] = false;
                }
              }
            });
          },
        ),
      ],
    );
  }
}

class Createambox extends StatelessWidget {
  const Createambox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 490,
          height: 60,
          child: Card(
            color: Color.fromARGB(255, 218, 143, 222),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Amount:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true, // Reduces the default vertical padding
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5), // Further adjust padding
                      border: OutlineInputBorder(), // Adds an outline border
                      // You can add more decoration properties as needed
                    ),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ), // Adjust text size as needed
                    // Add other TextField properties as needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Createingbox extends StatelessWidget {
  const Createingbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 490,
          height: 60,
          child: Card(
            color: Color(0xFFDE8F8F),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ingridient name:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true, // Reduces the default vertical padding
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 5), // Further adjust padding
                      border: OutlineInputBorder(), // Adds an outline border
                      // You can add more decoration properties as needed
                    ),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ), // Adjust text size as needed
                    // Add other TextField properties as needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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

class CreateRecipeListCard extends StatelessWidget {
  const CreateRecipeListCard({
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
              const CreateIngMainTile(),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    CreateIngredientTile(
                      label: "Add ingridient",
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

class CreateIngredientTile extends StatelessWidget {
  final String label; // First parameter
  // Third parameter

  // Update the constructor to accept three parameters
  const CreateIngredientTile({
    super.key,
    required this.label,
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 240, 13, 229),
            width: 2,
          ),
        ),
        child: Row(
          // Removed const since we are using dynamic values now
          children: [
            const SizedBox(width: 16),
            Text(label, style: textStyle), // Use the label parameter
            //Text(':', style: textStyle),
            const SizedBox(width: 20),
            //Text(), // Use the quantity parameter
            const SizedBox(width: 3),
            //Text(unit, style: textStyle), // Use the unit parameter
            IconButton(
              constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
              icon: Icon(Icons.add, size: 24),
              color: Color.fromARGB(255, 233, 228, 228),
              // Plus icon
              onPressed: () {
                // Add your action for this button
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CreateIngMainTile extends StatelessWidget {
  const CreateIngMainTile({
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
