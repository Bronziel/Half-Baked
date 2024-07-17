import 'package:flutter/material.dart';
import 'portionsize_tile.dart';
import '../../../components/smallicons.dart';
import 'timecards_tile.dart';

class IcontilesBox extends StatelessWidget {
  const IcontilesBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: const Color(0xff234234),
          width: 1,
        )),
        child: const Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Cardcolumns(),
            Iconcard(),
          ],
        ));
  }
}

//recipe
class Cardcolumns extends StatelessWidget {
  const Cardcolumns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DisplayPortionsizeCardWidget(
          portion: '15',
        ),
        SizedBox(
          height: 5,
        ),
        Displaytimesnow(
          title: "Prep Time:",
          time: "300",
        ),
        SizedBox(
          height: 5,
        ),
        Displaytimesnow(
          title: "Total Time:",
          time: "450",
        ),
      ],
    );
  }
}

///need diffrnet logic i tihnk
//create recipe
//vem använder ens denna?

//recipe
class Iconcard extends StatelessWidget {
  const Iconcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IconTile(iconName: 'Cow100'),
        IconTile(iconName: 'Bread100'),
      ],
    );
  }
}
