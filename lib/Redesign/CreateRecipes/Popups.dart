import 'package:flutter/material.dart';

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

class StyleUtils {
  static TextStyle labelstylepop() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
      color: Color(0xFF161414),
    );
  }

  static TextStyle textfieldstylepop() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 30,
      color: Color(0xFF161414),
    );
  }

  static TextStyle hintstylepop() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
    );
  }

  static OutlineInputBorder enabledborderstyle() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9896F1)),
    );
  }
}
