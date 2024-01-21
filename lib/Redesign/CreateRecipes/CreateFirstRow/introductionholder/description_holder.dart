import 'package:flutter/material.dart';

class Descriptionholder extends StatelessWidget {
  const Descriptionholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 130,
      decoration: boxouter(),
      child: Stack(children: [
        //actualbox with description in it
        Positioned(
          left: 60,
          child: SizedBox(
            width: 280,
            height: 130,
            child: Container(
              decoration: DDecoration(),
              child: const Column(
                children: [
                  CreateDescription(createdescription: 'Add a description'),
                  SizedBox(height: 8),
                  addbuttons(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  BoxDecoration boxouter() {
    return BoxDecoration(
        border: Border.all(
      color: const Color(0xff234234),
      width: 1,
    ));
  }

  BoxDecoration DDecoration() {
    return BoxDecoration(
        border: Border.all(
      color: const Color.fromARGB(255, 213, 6, 164),
      width: 2,
    ));
  }
}

class addbuttons extends StatelessWidget {
  const addbuttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: const Color(0xFFCECCCC),
      icon: const Icon(Icons.add), // Plus icon
      onPressed: () {
        // Add your action for this button
      },
    );
  }
}

class CreateDescription extends StatelessWidget {
  final String createdescription;
  const CreateDescription({
    super.key,
    this.createdescription = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      createdescription,
      softWrap: true,
      style: descriptionstyle(),
    );
  }

  TextStyle descriptionstyle() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFFFff),
    );
  }
}
