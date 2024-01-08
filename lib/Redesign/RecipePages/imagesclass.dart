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

const Map<String, String> iconTextPairs = {
  'Bread100': 'Bread',
  'Chicken100': 'Chicken',
  'Cow100': 'Cow',
  'Dessert100': 'Dessert',
  'Drinks100': 'Drinks',
  'Fish100': 'Fish',
  'Fruit100': 'Fruit',
  'Lamb100': 'Lamb',
  'Pig100': 'Pig',
  'SeaFood100': 'SeaFood',
  'Soup100': 'Soup',
  'Spicy100': 'Spicy',
  'Turkey100': 'Turkey',
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
    this.iconSize = 55, // Default size
    required this.iconTextPairs,
  });

  @override
  Widget build(BuildContext context) {
    String text = iconTextPairs[iconName] ?? 'Unknown';

    return SizedBox(
      // Add container properties if needed, like padding, margin, etc.
      width: 80,
      height: 80,
      child: Card(
        color: const Color(0xffD9D9D9),
        child: Stack(
          alignment:
              Alignment.center, // Align the icon and text within the stack
          children: <Widget>[
            Positioned(
              top: 1,
              child: SizedBox(
                width: 55,
                height: 55,
                child: Image.asset(
                  'images/new/icons/icon100/$iconName.png',
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
            Positioned(
              bottom: 0, // Position the text at the bottom of the stack
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 13.5, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
