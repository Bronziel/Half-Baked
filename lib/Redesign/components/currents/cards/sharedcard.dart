import 'package:flutter/material.dart';
import '../../smallicons.dart';
import '../../tiles/time_portion_tiles.dart';
import '../buttons.dart';

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
            iconcard(),
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
    );
  }
}

//create recipe
class addcardcolumn extends StatelessWidget {
  const addcardcolumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CreatePortionsizeCardWidget(),
        SizedBox(
          height: 5,
        ),
        CreateTimeCard(
          title: "Prep Time:",
        ),
        SizedBox(
          height: 5,
        ),
        CreateTimeCard(
          title: "Total Time:",
        ),
      ],
    );
  }
}

//recipe
class iconcard extends StatelessWidget {
  const iconcard({
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

//create
class addiconcard extends StatelessWidget {
  const addiconcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Addicon(),
        Addicon(),
      ],
    );
  }
}

//create
class Addicon extends StatelessWidget {
  const Addicon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      width: 80,
      child: Card(
        color: Color(0xffD9D9D9),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Addbuttoncontainer(
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}
