import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
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

  ChildWidget({required this.addItemCallback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Example item to add
        Item newItem = Item(myName2: 'yes', myName3: 'ok', myName: 'ok');
        addItemCallback(newItem);
      },
      child: Text('Add Item'),
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
