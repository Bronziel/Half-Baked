import 'package:flutter/material.dart';

class Titleholder extends StatelessWidget {
  const Titleholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff234234),
          width: 1,
        ),
      ),
      child: const Stack(
        children: <Widget>[
          Positioned(
            top: 11, // Your specified distance from the top
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Title(
                title: 'KebabRulle',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({
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
