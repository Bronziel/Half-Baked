import 'package:flutter/material.dart';

class Minie3 extends StatefulWidget {
  const Minie3({Key? key}) : super(key: key);

  @override
  State<Minie3> createState() => _Minie3State();
}

class _Minie3State extends State<Minie3> {
  // Method to add item and rebuild the UI
  void addItem(String text) {
    setState(() {
      myitems.add(Items(mytext: text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 600,
          height: 600,
          child: Card(
            color: Colors.amber,
            child: Column(
              children: [
                Textfinder(),
                // Updated to include the addItem callback
                Expanded(
                  child: ListView.builder(
                    itemCount: myitems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(myitems[index].mytext),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Items {
  final String mytext;

  Items({required this.mytext});
}

List<Items> myitems = [];

class Textfinder extends StatefulWidget {
  const Textfinder({Key? key}) : super(key: key);

  @override
  State<Textfinder> createState() => _TextfinderState();
}

class _TextfinderState extends State<Textfinder> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
                controller: myController,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Use the addItem method from the parent widget to add the item
            if (context.findAncestorStateOfType<_Minie3State>() != null) {
              context
                  .findAncestorStateOfType<_Minie3State>()!
                  .addItem(myController.text);
            }
            myController.clear(); // Clear the text field
          },
          child: const Icon(Icons.save), // Changed icon to indicate save action
        ),
      ],
    );
  }
}
