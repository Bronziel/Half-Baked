import 'package:flutter/material.dart';
import '../Dialog/buttons_dialog/buttons.dart';
import '../../components/styles/uidescriptionshared.dart';
import '../Dialog/description_dialog.dart';

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
    return const Descriptionadd();
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

class Descriptionadd extends StatelessWidget {
  const Descriptionadd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Add a description',
          softWrap: true,
          style: descriptionstyle(),
        ),
        const SizedBox(height: 8),
        Addbuttoncontainer(
            onPressed: () => DescriptionDialog.addDescription(context)),
      ],
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

class DescriptionHandler extends StatefulWidget {
  const DescriptionHandler({
    super.key,
  });

  @override
  State<DescriptionHandler> createState() => _DescriptionHandlerState();
}

class _DescriptionHandlerState extends State<DescriptionHandler> {
  String? myDescription;

  void addDescription(String newDescription) {
    setState(() {
      myDescription = newDescription;
    });
  }

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
              child: myDescription == null
                  ? const Descriptionadd()
                  : const Description(),
            )),
      ]),
    );
  }
}
