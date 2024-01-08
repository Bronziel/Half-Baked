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

Map<String, String> iconTextPairs = {
  'Bread100': 'Bread',
  'Chicken100': 'Chicken',
  'Cow100': 'Cow',
  'Desert100': 'Desert',
  'Drinks100': 'Drinks',
  'Fish100': 'Fish',
  'Fruit100': 'Fruit',
  'Lamb100': 'Lamb',
  'Pig100': 'Pig',
  'SeaaFood100': 'SeaFood',
  'soup100': 'Soup',
  'Spicy100': 'Spicy',
  'turkey100': 'Turkey',
  'Vegetable100': 'Vegetable',

  // Add more pairs as needed
};

class IconTileText extends StatelessWidget {
  final String iconName;
  final double iconSize;
  final Map<String, String> iconTextPairs;

  const IconTileText({
    super.key,
    required this.iconName,
    this.iconSize = 57.16, // Default size set to 66.67
    required this.iconTextPairs,
  });

  @override
  Widget build(BuildContext context) {
    String text = iconTextPairs[iconName] ?? 'Unknown';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          // Center the image
          child: Image.asset(
            'images/new/icons/icon100/$iconName.png',
            width: iconSize,
            height: iconSize,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ), // Display the associated text
      ],
    );
  }
}
