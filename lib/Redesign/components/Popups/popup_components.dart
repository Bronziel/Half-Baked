import 'package:flutter/material.dart';
import '../styles/style.dart';

class PostionedStopButton extends StatelessWidget {
  const PostionedStopButton({
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

class PostionedSaveButton extends StatelessWidget {
  const PostionedSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 10,
      right: 10,
      child: SaveButton(),
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
      // add to list
      //set state
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleUtils.mainncolor(),
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

//required this.title,
//final String title;
//Titles(title: title),
class Titles extends StatelessWidget {
  const Titles({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 10,
        top: 10,
        child: Text(
          title,
          style: StyleUtils.titelstylepop(),
        ));
  }
}
