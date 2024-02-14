import 'package:flutter/material.dart';
import 'styletest.dart';

class PostionedSaveButtontest extends StatelessWidget {
  const PostionedSaveButtontest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 10,
      right: 10,
      child: SaveButtontest(),
    );
  }
}

class SaveButtontest extends StatelessWidget {
  const SaveButtontest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // add to list
      //set state
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleUtilstest.mainncolor(),
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

//close button
class PostionedStopButtontest extends StatelessWidget {
  const PostionedStopButtontest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 10,
      right: 10,
      child: Stopdownbutton(),
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
        Navigator.of(context).pop();
        // Add your action for this button
      },
    );
  }
}
