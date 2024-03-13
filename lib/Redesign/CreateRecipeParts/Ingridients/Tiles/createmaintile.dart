import 'package:flutter/material.dart';
import '../../../components/styles/icons2/carticons.dart';

class Createmaintitle extends StatelessWidget {
  const Createmaintitle({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      color: const Color(0xFFD9D9D9),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 10,
            child: Carticon(),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Ingtextmain(textStyle: textStyle),
            ),
          ),
          const Positioned(
            top: 10,
            right: 20,
            child: Carticon(),
          ),
        ],
      ),
    );
  }
}
