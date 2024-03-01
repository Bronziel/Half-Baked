import 'package:flutter/material.dart';
import '../Dialog/buttons_dialog/buttons.dart';
import '../../components/styles/uidescriptionshared.dart';
import '../Dialog/description_dialog.dart';
import 'create_title.dart';

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

  void editDescription(String editDescritpion) {
    setState(() {
      myDescription = editDescritpion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 130,
      decoration: boxouter(),
      child: myDescription == null
          ? Descriptionadd(
              addDescription: addDescription,
            )
          : Description(description: myDescription!),
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
    return Stack(
      children: [
        Positioned(
          left: 60,
          child: SizedBox(
            width: 280,
            height: 130,
            child: Text(
              description,
              softWrap: true,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFff),
              ),
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 45,
            child: Editcontainer(
              onPressedEdit: () {},
            ))
      ],
    );
  }
}

class Descriptionadd extends StatelessWidget {
  final Function(String) addDescription;
  const Descriptionadd({
    required this.addDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 60,
          child: SizedBox(
            width: 280,
            height: 130,
            child: Column(
              children: [
                Text(
                  'Add a description',
                  softWrap: true,
                  style: descriptionstyle(),
                ),
                const SizedBox(height: 8),
                Addbuttoncontainer(
                    onPressed: () => DescriptionDialog.addDescription(
                          addDescription,
                          context,
                        )),
              ],
            ),
          ),
        ),
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
