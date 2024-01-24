import 'package:flutter/material.dart';

import '../buttons.dart';

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

class Descirptionholder extends StatelessWidget {
  final bool showObject1;

  const Descirptionholder({
    required this.showObject1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 130,
      decoration: boxouter(),
      child: Stack(children: [
        Positioned(
            left: 60,
            child: SizedBox(
              width: 280,
              height: 130,
              child: showObject1 ? object1() : object2(),
            )),
      ]),
    );
  }

  Widget object1() {
    return const Description(
        description: 'En god Kebab rulle som aldrig gör en Besviken.');
  }

  Widget object2() {
    return const descriptionadd();
  }
}

class descriptionadd extends StatelessWidget {
  const descriptionadd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateDescription(createdescription: 'Add a description'),
        SizedBox(height: 8),
        Addbuttoncontainer(),
      ],
    );
  }
}

class Description extends StatelessWidget {
  final String description;
  const Description({
    super.key,
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      softWrap: true,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFff),
      ),
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
