import 'package:flutter/material.dart';
import '../../../../components/tiles/time_portion_tiles.dart';
import '../../../../components/smallicons.dart';
import '../../../../components/currents/introductionholder/descriptionshared.dart';
import 'package:fb2/Redesign/components/currents/buttons.dart';

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
            Titleholder(),
            Descirptionholder(showObject1: true),
            IcontilesBox(),
          ],
        ),
      ),
    );
  }
}

class Titleholder extends StatelessWidget {
  const Titleholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff234234),
          width: 1,
        ),
      ),
      child: const Stack(
        children: <Widget>[
          Positioned(
            top: 11, // Your specified distance from the top
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Title(
                title: 'KebabRulle',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 40,
        color: Color(0xFFFFFFFF), // Corrected color format
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
