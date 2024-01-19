import 'package:flutter/material.dart';
import '../components/sizedboxes.dart';

import 'package:flutter/services.dart';
import 'style.dart';
import 'style_objects.dart';
import 'popup_boxes.dart';

class CreateSecondRowWidget extends StatelessWidget {
  const CreateSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        CreateRecipeListCard(),
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
      width: 1200,
      height: 474,
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
                    EditingTile(
                      label: 'Kebab',
                      amount: '500',
                      unit: 'g',
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
            color: const Color.fromARGB(255, 240, 13, 229),
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
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
              icon: const Icon(Icons.add, size: 24),
              color: const Color.fromARGB(255, 233, 228, 228),
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

class EditingTile extends StatelessWidget {
  final String label; // First parameter
  final String amount;
  final String unit;
  // Third parameter

  // Update the constructor to accept three parameters
  const EditingTile({
    super.key,
    required this.label,
    required this.amount,
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
      child: SizedBox(
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            IconButton(
              onPressed: () {
                print('menue clicked');
              },
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 233, 228, 228),
              ),
            ),
            const SizedBox(width: 16),
            Text(label, style: textStyle), // Use the label parameter
            const Text(':', style: textStyle),
            const SizedBox(width: 20),
            Text(amount, style: textStyle), // Use the quantity parameter
            const SizedBox(width: 3),
            Text(unit, style: textStyle), // Use the unit parameter
            const SizedBox(
              width: 130,
            ),
            IconButton(
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
              icon: const Icon(Icons.edit, size: 24),
              color: const Color.fromARGB(255, 233, 228, 228),
              // Plus icon
              onPressed: () {
                print('Edit clicked');
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
