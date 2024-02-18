import 'package:flutter/material.dart';

class Minie3 extends StatefulWidget {
  const Minie3({super.key});

  @override
  State<Minie3> createState() => _Minie3State();
}

class _Minie3State extends State<Minie3> {
  // Method to add item and rebuild the UI
  //defining text here
  void addItem(String text, String stepText) {
    setState(() {
      //parameter för sätta vilken info är vad items kräver mytext.vi säger hämta text från textfield
      myitems.add(Items(mytext: text, stepText: stepText));
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
                const Textfinder(),
                // Updated to include the addItem callback
                Expanded(
                  child: ListView.builder(
                    itemCount: myitems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(myitems[index].mytext),
                        leading: Text(myitems[index].stepText),
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
  final String stepText;

  Items({required this.mytext, required this.stepText});
}

List<Items> myitems = [];

class Textfinder extends StatefulWidget {
  const Textfinder({super.key});

  @override
  State<Textfinder> createState() => _TextfinderState();
}

class _TextfinderState extends State<Textfinder> {
  final myController = TextEditingController();
  final mySecondController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    mySecondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 400,
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                    controller: myController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                    controller: mySecondController,
                  ),
                ],
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
                  .addItem(myController.text, mySecondController.text);
            }
            myController.clear(); // Clear the text field
            mySecondController.clear();
          },
          child: const Icon(Icons.save), // Changed icon to indicate save action
        ),
      ],
    );
  }
}

//savebutton for singel item not 2
/*
ElevatedButton(
          onPressed: () {
            // Use the addItem method from the parent widget to add the item
            if (context.findAncestorStateOfType<_Minie3State>() != null) {
              context.findAncestorStateOfType<_Minie3State>()!.addItem(
                    myController.text
                  );
            }
            myController.clear(); // Clear the text field
          },
          child: const Icon(Icons.save), // Changed icon to indicate save action
        ),*/