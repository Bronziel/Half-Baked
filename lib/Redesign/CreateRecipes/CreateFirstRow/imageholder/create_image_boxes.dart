import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';
import '../../../components/currents/sharingimgholder.dart';

class CreateMainImagePlusBoxes extends StatelessWidget {
  const CreateMainImagePlusBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Createbigimg(),
          const Width20StandardWidget(),
          Createsmallimg(),
        ],
      ),
    );
  }
}

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
            child: addiconimgsmall(),
          ),
        ),
      ],
    );
  }
}

class Createbigimg extends StatelessWidget {
  const Createbigimg({
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
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
              width: 50,
              height: 50,
              child: addiconimgbig(),
            ),
            Text(
              'Add Images',
              style: textstyleaddbigimage(),
            ),
          ],
        ),
        // Add other properties of Card if needed
      ),
    );
  }

  TextStyle textstyleaddbigimage() {
    return TextStyle(
      fontSize: 30,
    );
  }
}

class addiconimgsmall extends StatelessWidget {
  const addiconimgsmall({
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

class addiconimgbig extends StatelessWidget {
  const addiconimgbig({
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
