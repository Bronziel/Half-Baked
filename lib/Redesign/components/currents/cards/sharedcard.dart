import 'package:flutter/material.dart';
import '../../smallicons.dart';
import '../buttons.dart';
import 'fixedportionsize.dart';
import 'fixedtimecard.dart';

//alla 5 objek ska kunnas byta
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
        PortionsizeCardWidget(
          showdisplayport: true,
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
class Addcardcolumn extends StatelessWidget {
  const Addcardcolumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PortionsizeCardWidget(
          showdisplayport: false,
          portion: '15',
        ),
        SizedBox(
          height: 5,
        ),
        TimeCard(
          showdisplaytime: false,
          titleadd: "Prep Time:",
          title: "",
          time: "",
          prepOrTotal: true,
        ),
        SizedBox(
          height: 5,
        ),
        TimeCard(
          showdisplaytime: false,
          titleadd: "Total Time:",
          title: "",
          time: "",
          prepOrTotal: true,
        ),
      ],
    );
  }
}

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

//create
class Addiconcard extends StatelessWidget {
  const Addiconcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
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
            child: Addbuttoncontainer3(
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}

class Addbuttoncontainer3 extends StatelessWidget {
  final Color color; // Add a color property

  const Addbuttoncontainer3({
    super.key,
    this.color = const Color(0xFFCECCCC), // Set default color
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add, size: 24),
      color: color, // Use the color property
      onPressed: () {},
    );
  }
}
