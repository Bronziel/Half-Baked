import 'package:flutter/material.dart';
import 'create_time_tile.dart';
import 'create_portion_tile.dart';

class CreateIcontilesBox extends StatelessWidget {
  const CreateIcontilesBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Addcardcolumn(),
        Addiconcard(),
      ],
    ));
  }
}

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
          showdisplaytime:
              false, //true for showing done recipe false for adding
          titleadd: "Prep Time:",
          title: "",
          time: "",
          prepOrTotal: true, //true is for totaltime
        ),
        SizedBox(
          height: 5,
        ),
        TimeCard(
          showdisplaytime: false,
          titleadd: "Total Time:",
          title: "",
          time: "",
          prepOrTotal: false, //false is for totaltime
        ),
      ],
    );
  }
}

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
