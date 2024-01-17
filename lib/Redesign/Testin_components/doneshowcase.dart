import 'package:fb2/Redesign/components/imagesclass.dart';
import 'package:flutter/material.dart';
import '../components/components_redesign.dart';
import 'showcase.dart';

import 'buildcomponents.dart';

class RowOfIcons80 extends StatelessWidget {
  const RowOfIcons80({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            IconTile(iconName: 'Pig100'),
            IconTile(iconName: 'Soup100'),
            IconTile(iconName: 'SeaFood100'),
            IconTile(iconName: 'Fruit100'),
            IconTile(iconName: 'Drinks100'),
            IconTile(iconName: 'Bread100'),
            IconTile(iconName: 'Lamb100'),
            IconTile(iconName: 'Cow100'),
            IconTile(iconName: 'Turkey100'),
            IconTile(iconName: 'Dessert100'),
            IconTile(iconName: 'Chicken100'),
            IconTile(iconName: 'Fish100'),
            IconTile(iconName: 'Vegetable100'),
          ],
        ),
        Row(
          children: [
            IconTileText(
              iconName: 'Pig100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Soup100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'SeaFood100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Fruit100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Drinks100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Bread100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Lamb100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Cow100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Turkey100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Dessert100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Chicken100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Fish100',
              iconTextPairs: iconTextPairs,
            ),
            IconTileText(
              iconName: 'Vegetable100',
              iconTextPairs: iconTextPairs,
            ),
          ],
        ),
      ],
    );
  }
}

class TimeTIlesshowcase extends StatelessWidget {
  const TimeTIlesshowcase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PortionsizeCardWidget(),
        TimeCard(
          title: "Total Time:",
          time: "450",
        ),
        TimeCard(
          title: "Prep Time:",
          time: "300",
        ),
      ],
    );
  }
}

class ShowcaseButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const ShowcaseButton({
    super.key,
    this.buttonText = 'ShowCase',
    this.buttonColor = const Color.fromARGB(255, 189, 12, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShowcasePage()),
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

class listButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const listButton({
    super.key,
    this.buttonText = 'list',
    this.buttonColor = const Color.fromARGB(255, 12, 122, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DropdownMenuExample()),
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
