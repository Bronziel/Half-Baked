import 'package:flutter/material.dart';
import '../components/sizedboxes.dart';
import 'Popups.dart';

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
        child: Saveingridient(),
      ),
    );
  }
}

class Saveingridient extends StatelessWidget {
  const Saveingridient({
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
                    Popups(),
                    PopDescription(),
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

class Popups extends StatelessWidget {
  const Popups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PopTitle();
  }
}

class PopTitle extends StatelessWidget {
  const PopTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 360,
      height: 105,
      child: Card(
        color: Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Positioned(
              // Set the position for the TextField
              bottom: 10, // Adjust these values as needed
              left: 10, // Adjust these values as needed

              child: SizedBox(
                width: 240,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Add a title',
                    labelStyle: TextStyle(
                      fontFamily: 'Paprika',
                      fontSize: 20,
                      color: Color(0xFF161414),
                    ),
                    hintText: "Title",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF9896F1)),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                    color: Color(0xFF161414),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              child: Titleaddtext(),
            ),
            Positioned(
              right: 10,
              child: Stopdownbutton(),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: SaveButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PopDescription extends StatelessWidget {
  const PopDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 460,
      height: 205,
      child: Card(
        color: Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Positioned(
                left: 10,
                top: 10,
                child: DTwidget(
                  title: 'Description:',
                )),
            Positioned(
              bottom: 10,
              left: 10,
              top: 45,
              right:
                  100, // Adjusted to ensure the TextField is more square-like
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Add a Description',
                  labelStyle: TextStyle(
                    fontFamily: 'Paprika',
                    fontSize: 20,
                    color: Color(0xFF161414),
                  ),
                  hintText: "Description",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF9896F1)),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Paprika',
                  fontSize: 20,
                  color: Color(0xFF161414),
                ),
                maxLines: null, // Allows for unlimited lines
                minLines: 5, // Set this to a desired initial size
              ),
            ),
            Positioned(
              left: 10,
              child: Titleaddtext(),
            ),
            Positioned(
              right: 10,
              child: Stopdownbutton(),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: SaveButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class DTwidget extends StatelessWidget {
  final String title;
  const DTwidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Description',
      style: TextStyle(
        fontFamily: title,
        fontWeight: FontWeight.w800, // ExtraBold
        fontSize: 20,
      ),
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
