import 'package:flutter/material.dart';
import 'PortionsizeTile.dart';
import '../../components/currents/cards/fixedtimecard.dart';
import '../../components/smallicons.dart';

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
        TimeCard(
          showdisplaytime: true,
          titleadd: '',
          title: "Prep Time:",
          time: "300",
          prepOrTotal: false,
        ),
        SizedBox(
          height: 5,
        ),
        TimeCard(
          showdisplaytime: true,
          titleadd: '',
          title: "Total Time:",
          time: "450",
          prepOrTotal: false,
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
