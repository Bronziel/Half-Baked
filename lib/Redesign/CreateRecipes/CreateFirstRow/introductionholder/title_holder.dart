import 'package:flutter/material.dart';

class Titelholder extends StatelessWidget {
  const Titelholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 75,
      decoration: jajsjs2(),
      //title row
      child: Row(
        children: [
          const SizedBox(
            width: 60,
          ),
          SizedBox(
            width: 280,
            child: Container(
              decoration: sdasdasd(),
              child: const Row(
                children: [
                  CreateTitle(
                    createtitle: 'Add title',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  addss3(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration sdasdasd() {
    return BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 213, 6, 164),
        width: 2,
      ),
    );
  }

  BoxDecoration jajsjs2() {
    return BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 70, 115, 231),
        width: 1,
      ),
    );
  }
}

class addss3 extends StatelessWidget {
  const addss3({
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

class CreateTitle extends StatelessWidget {
  final String createtitle;
  const CreateTitle({
    super.key,
    this.createtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      createtitle,
      style: titlesstyle(),
    );
  }

  TextStyle titlesstyle() {
    return const TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 40,
      color: Color(0xFFFFFFFF), // Corrected color format
    );
  }
}
