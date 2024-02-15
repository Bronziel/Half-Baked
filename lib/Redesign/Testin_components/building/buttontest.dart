import 'package:flutter/material.dart';
import 'styletest.dart';

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
