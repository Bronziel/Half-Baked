import 'package:flutter/material.dart';
import 'simpleone/okeyy.dart';

///import 'learn_json togheter.txt';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Minie3(),
      ),
    );
  }
}

class Addbuttoncontainertest extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color; // Add a color property

  const Addbuttoncontainertest({
    required this.onPressed,
    super.key,
    this.color = const Color(0xFFCECCCC), // Set default color
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add, size: 24),
      color: color, // Use the color property
      onPressed: onPressed,
    );
  }
}
