import 'package:flutter/material.dart';

class Addinngtile extends StatelessWidget {
  const Addinngtile({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white, // Set your desired color here
    );

    return Container(
      height: 50,
      width: 500,
      color: const Color(0xff161414),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 240, 13, 229),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 10,
              child: Text('Add an Ingridient', style: textStyle),
            ),
            const Positioned(
              top: 5,
              right: 10,
              child: Addbuttoncontainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class Addbuttoncontainer extends StatelessWidget {
  const Addbuttoncontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.add, size: 24),
      color: const Color.fromARGB(255, 233, 228, 228),
      // Plus icon
      onPressed: () {
        // Add your action for this button
      },
    );
  }
}
