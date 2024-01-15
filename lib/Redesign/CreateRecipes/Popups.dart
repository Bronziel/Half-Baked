import 'package:flutter/material.dart';

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

class Stopdownbutton extends StatelessWidget {
  const Stopdownbutton({
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
