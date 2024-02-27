import 'package:flutter/material.dart';
import '../../components/currents/buttons.dart';
import '../../components/Popups/popupDialogclass.dart';
import '../../components/styles/uidescriptionshared.dart';

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

class Descriptionadd extends StatelessWidget {
  const Descriptionadd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateDescription(createdescription: 'Add a description'),
        const SizedBox(height: 8),
        Addbuttoncontainer(
            onPressed: () => DialogUtils.showDescriptionDialog(context)),
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
