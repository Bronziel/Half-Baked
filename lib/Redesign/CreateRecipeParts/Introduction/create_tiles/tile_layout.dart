import 'package:flutter/material.dart';
import 'create_portion_tile.dart';
import '../create_times.dart';

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
        TimePrepTotalHandler(),
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

//statefullwidget
//nah remove this make tiem card and portion statefullwidgets insted.

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
