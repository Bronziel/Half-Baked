import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;

  const CustomAppBar({Key? key, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('images/icons/bestick.png'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'CustomFont', // Specify the custom font here
          color: Color(0xFF9896F1), // And the color here
        ),
      ),
      backgroundColor: color ?? Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
