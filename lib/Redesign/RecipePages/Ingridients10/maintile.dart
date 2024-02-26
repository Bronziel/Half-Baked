import 'package:flutter/material.dart';
import '../../components/styles/icons2/carticons.dart';

class IngMaintileDisplay extends StatelessWidget {
  const IngMaintileDisplay({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 410,
      color: const Color(0xFFD9D9D9),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Carticon(),
          const SizedBox(width: 82),
          Ingtextmain(textStyle: textStyle),
          const SizedBox(width: 82),
          const Carticon(),
        ],
      ),
    );
  }
}
