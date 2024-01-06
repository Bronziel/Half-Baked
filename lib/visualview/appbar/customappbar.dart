import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final List<Widget> actions; // Add this line

  const CustomAppBar({
    Key? key,
    required this.title,
    this.color,
    this.actions = const [], // And this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('images/icons/bestick.png'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'CustomFont', // Specify the custom font here
          color: Color(0xFF9896F1), // And the color here
        ),
      ),
      backgroundColor: color ?? Theme.of(context).primaryColor,
      actions: actions, // And this line
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
