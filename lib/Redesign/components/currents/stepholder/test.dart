import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  List<Item> items = []; // Assuming 'Item' is your data model

  void addItem(Item newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChildWidget(addItemCallback: addItem),
        // Other widgets that should update based on 'items'
      ],
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(Item) addItemCallback;

  const ChildWidget({
    required this.addItemCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Example item to add
        Item newItem = Item(myName2: 'yes', myName3: 'ok', myName: 'ok');
        addItemCallback(newItem);
      },
      child: const Text('Add Item'),
    );
  }
}

class Item {
  final String myName;
  final String myName2;
  final String myName3;
  Item({
    required this.myName,
    required this.myName2,
    required this.myName3,
  });
}
