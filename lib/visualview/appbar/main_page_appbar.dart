/*not added yet to main page*/
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('images/icons/bestick.png'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title),
      backgroundColor:
          Colors.green, // Sets the AppBar color to the passed color
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
