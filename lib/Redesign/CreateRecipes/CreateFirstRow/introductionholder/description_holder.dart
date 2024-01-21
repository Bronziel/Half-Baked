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
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color(0xff234234),
        width: 1,
      )),
      child: Row(children: [
        const SizedBox(
          width: 60,
        ),
        //actualbox with description in it
        SizedBox(
          width: 280,
          height: 130,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: const Color.fromARGB(255, 213, 6, 164),
              width: 2,
            )),
            child: Column(
              children: [
                const CreateDescription(createdescription: 'Add a description'),
                const SizedBox(height: 8),
                IconButton(
                  color: const Color(0xFFCECCCC),
                  icon: const Icon(Icons.add), // Plus icon
                  onPressed: () {
                    // Add your action for this button
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          width: 60,
        ),
      ]),
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
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFff),
      ),
    );
  }
}
