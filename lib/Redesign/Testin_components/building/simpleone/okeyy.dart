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

List<Items> myitems = [
  Items(mytext: 'starting point', stepText: 'starting point')
];

class Textfinder extends StatefulWidget {
  const Textfinder({super.key});

  @override
  State<Textfinder> createState() => _TextfinderState();
}

class _TextfinderState extends State<Textfinder> {
  final myController = TextEditingController();
  final mySecondController = TextEditingController();

  // State variables for error messages
  String? _errorText1;
  String? _errorText2;

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
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                      border: const OutlineInputBorder(),
                      errorText: _errorText1,
                    ),
                    controller: myController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                      border: const OutlineInputBorder(),
                      //eror text hantereat auutomatisk röd ring etc men man kan  customisa ifall man vill
                      errorText: _errorText2,
                    ),
                    controller: mySecondController,
                  ),
                ],
              ),
            ),
          ),
        ),
        ElevatedButton(
          //here
          onPressed: () {
            // Reset error messages
            setState(() {
              _errorText1 =
                  myController.text.isEmpty ? 'Field cannot be empty' : null;
              _errorText2 = mySecondController.text.isEmpty
                  ? 'Field cannot be empty'
                  : null;
            });

            // Proceed if no errors
            //if both eror text and eror text 2 are equal to nun jump into this. null is no issue
            if (_errorText1 == null && _errorText2 == null) {
              //create state so i dont have to write it out all the time
              final state = context.findAncestorStateOfType<_Minie3State>();
              if (state != null) {
                state.addItem(myController.text, mySecondController.text);
              }
              // Clear the text fields after adding
              myController.clear();
              mySecondController.clear();
            }
          },
          //here
          child: const Icon(Icons.save), // Keep the save icon
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
