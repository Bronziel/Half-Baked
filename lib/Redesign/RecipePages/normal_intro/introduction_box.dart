import 'package:flutter/material.dart';
import 'title_box.dart';
import 'description_box.dart';
import 'Tiles/Tilesbox.dart';

class Intro extends StatelessWidget {
  const Intro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      width: 410,
      child: Card(
        color: Color(0xFF161414),
        child: Column(
          children: [
            DisplaynormalBasictitle(
              title: 'Laxpasta med lime',
            ),
            DisplayDescription(
                description: 'En god Kebab rulle som aldrig gör en Besviken.'),
            IcontilesBox(),
          ],
        ),
      ),
    );
  }
}
