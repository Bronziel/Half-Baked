import 'package:flutter/material.dart';
import '../../../../components/tiles/time_portion_tiles.dart';
import '../../../../components/smallicons.dart';
import '../../../../components/currents/introductionholder/descriptionshared.dart';
import '../../../../components/currents/sharedtitle.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
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
            Titleholder(showtitle: true),
            Descirptionholder(showObject1: true),
            IcontilesBox(),
          ],
        ),
      ),
    );
  }
}

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
            Column(
              children: [
                PortionsizeCardWidget(
                  portion: '15',
                ),
                SizedBox(
                  height: 5,
                ),
                TimeCard(
                  title: "Prep Time:",
                  time: "300",
                ),
                SizedBox(
                  height: 5,
                ),
                TimeCard(
                  title: "Total Time:",
                  time: "450",
                ),
              ],
            ),
            Column(
              children: [
                IconTile(iconName: 'Cow100'),
                IconTile(iconName: 'Bread100'),
              ],
            ),
          ],
        ));
  }
}
