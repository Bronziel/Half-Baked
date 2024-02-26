import 'package:flutter/material.dart';

class Carticon extends StatelessWidget {
  const Carticon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/new/icons/cart.png');
  }
}

class Ingtextmain extends StatelessWidget {
  const Ingtextmain({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text("Ingridients", style: textStyle);
  }
}
