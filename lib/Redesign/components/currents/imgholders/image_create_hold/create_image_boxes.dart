import 'package:flutter/material.dart';
import '../sharingimgholder.dart';

class Createsmallimg extends StatelessWidget {
  const Createsmallimg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: smallimgheight,
          width: smallimgwidth,
          child: Card(
            shape: smallImageShape(),
            child: const Addiconimgsmall(),
          ),
        ),
      ],
    );
  }
}

class Createbigimg extends StatelessWidget {
  final Widget needed;
  const Createbigimg({
    required this.needed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightimage,
      width: widthbigimage,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Define the border radius here
        ),
        child: Column(
          children: [
            needed,
          ],
        ),
        // Add other properties of Card if needed
      ),
    );
  }

  TextStyle textstyleaddbigimage() {
    return const TextStyle(
      fontSize: 30,
    );
  }
}

class Addiconimgsmall extends StatelessWidget {
  const Addiconimgsmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.add, size: 24),
      color: const Color.fromARGB(255, 12, 11, 11),
      // Plus icon
      onPressed: () {
        // Add your action for this button
      },
    );
  }
}

class Addiconimgbig extends StatelessWidget {
  const Addiconimgbig({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.add, size: 24),
      color: const Color.fromARGB(255, 12, 11, 11),
      // Plus icon
      onPressed: () {
        // Add your action for this button
      },
    );
  }
}
