import 'package:flutter/material.dart';
import '../building/listviewreorder.dart';

class Reord extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const Reord({
    super.key,
    this.buttonText = 'Reorderlistview',
    this.buttonColor = const Color.fromARGB(255, 12, 122, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReorderableApp()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}
