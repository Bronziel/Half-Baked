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
      title: Text(title),
      backgroundColor: color ?? Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
