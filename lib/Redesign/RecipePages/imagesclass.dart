import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final String iconName;
  final double iconSize;

  const IconTile({
    super.key,
    required this.iconName,
    this.iconSize = 66.67, // Default size set to 30
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/new/icons/icon100/$iconName.png',
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
