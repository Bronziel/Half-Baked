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
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 70, 115, 231),
          width: 1,
        ),
      ),
      //title row
      child: Row(
        children: [
          const SizedBox(
            width: 60,
          ),
          SizedBox(
            width: 280,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 213, 6, 164),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  const CreateTitle(
                    createtitle: 'Add title',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
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
        ],
      ),
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
      style: const TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 40,
        color: Color(0xFFFFFFFF), // Corrected color format
      ),
    );
  }
}
