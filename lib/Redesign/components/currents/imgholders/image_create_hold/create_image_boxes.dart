import 'package:flutter/material.dart';
import '../../../styles/spacing/sizedboxes.dart';
import '../sharingimgholder.dart';
import 'imagepicker.dart';

class CreateMainImagePlusBoxes extends StatelessWidget {
  const CreateMainImagePlusBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          Createbigimg(),
          Width20StandardWidget(),
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
            child: const Addiconimgsmall(),
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
        child: const Column(
          children: [
            ImagePickerRedone(),
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
