import 'package:flutter/material.dart';
import '../../components/sizedboxes.dart';

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
    return const Row(
      children: [
        SizedBox(
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
                          fontSize:
                              20, // Adjust the font size for the label as needed
                          color: Color(0xFF161414),
                        ),
                        hintText: "Title", // Placeholder text
                        border:
                            OutlineInputBorder(), // Adds border to the TextField
                        // You can add more decoration properties as needed
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(
                                  0xFF9896F1)), // Replace with desired color
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 30,
                        color: Color(0xFF161414), // Corrected color format
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
                  child: CloseButton(),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: SaveButton(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Titleaddtext extends StatelessWidget {
  const Titleaddtext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '',
      style: TextStyle(
        fontFamily: 'inter',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      color: const Color(0xFF000000),
      icon: const Icon(Icons.close), // Plus icon
      onPressed: () {
        // Add your action for this button
      },
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9896F1),
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 12), // Padding inside the button
        // Other style properties
      ),
      child: const Row(
        mainAxisSize:
            MainAxisSize.min, // Use min to wrap content inside the button
        children: <Widget>[
          Icon(Icons.add, color: Color(0xFFFFFFFF)), // Your icon
          SizedBox(width: 8), // Space between icon and text
          Text(
            'Save',
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ), // Your text
        ],
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
