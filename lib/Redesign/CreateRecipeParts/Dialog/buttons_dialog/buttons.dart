import 'package:flutter/material.dart';

//used by title,description,total,prep,portionsize,add ingiridnet tile
class Addbuttoncontainer extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color; // Add a color property

  const Addbuttoncontainer({
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
//onPressed: () => DialogUtils.me(context),