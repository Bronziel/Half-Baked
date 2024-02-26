import 'package:flutter/material.dart';
import '../../components/styles/uidescriptionshared.dart';

class DisplayDescription extends StatelessWidget {
  final String description;
  const DisplayDescription({
    super.key,
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxouter(),
      width: 410,
      height: 130,
      child: Stack(
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
        ],
      ),
    );
  }
}
