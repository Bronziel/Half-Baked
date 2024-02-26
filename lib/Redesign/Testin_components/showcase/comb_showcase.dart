import 'package:fb2/Redesign/components/smallicons.dart';
import 'package:flutter/material.dart';
import '../../components/Popups/popup_boxes.dart';
import '../../RecipePages/normal_intro/Tiles/PortionsizeTile.dart';
import '../../CreateRecipeParts/Introduction/Createtimecards2.dart';

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
        DisplayPortionsizeCardWidget(
          portion: '15',
        ),
        TimeCard(
          showdisplaytime: true,
          titleadd: '',
          title: "Total Time:",
          time: "450",
          prepOrTotal: false,
        ),
        TimeCard(
          showdisplaytime: true,
          titleadd: '',
          title: "Prep Time:",
          time: "300",
          prepOrTotal: false,
        ),
      ],
    );
  }
}

class Popupsdisplayed extends StatelessWidget {
  const Popupsdisplayed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          children: [
            PopTimePort(
              title: 'PrepTime:',
              labelText: 'Add Preperation time',
              hintText: 'preparation time in minutes',
            ),
            PopTimePort(
              title: 'TotalTime:',
              labelText: 'Add Total cooking time',
              hintText: 'Total cooking time in minutes',
            ),
            PopTimePort(
              title: 'Portionsize:',
              labelText: 'Add Portion size',
              isPortionSize: true, // Used to set the keyboard type to text
            ),
            SmallTextfieldPop(
              title: 'Steps Title:',
              labelText: 'Add a steps title',
              hintText: 'Ex Sidesallad, Prepping meat',
            ),
            SmallTextfieldPop(
              title: 'Title:',
              labelText: 'Add a title',
              hintText: 'Ex Kebabrulle',
            ),
          ],
        ),
        Column(
          children: [
            PopDescription(
              title: 'Description',
            ),
          ],
        ),
        Column(
          children: [
            Popsteps(
              title: 'Step 1:',
            )
          ],
        ),
      ],
    );
  }
}
