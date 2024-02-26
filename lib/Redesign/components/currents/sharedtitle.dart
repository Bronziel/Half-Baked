import 'package:flutter/material.dart';

class Titlewierd extends StatelessWidget {
  final String title;
  const Titlewierd({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 40,
        color: Color(0xFFFFFFFF), // Corrected color format
      ),
    );
  }
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
