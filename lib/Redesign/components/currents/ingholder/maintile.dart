import 'package:flutter/material.dart';

class IngMainTile extends StatelessWidget {
  final bool showMaintile;
  const IngMainTile({
    required this.showMaintile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF000000), // Set your desired color here
    );

    return showMaintile ? normaltile(textStyle) : addtilesize(textStyle);
  }

  Widget normaltile(TextStyle textStyle) {
    return Ingtiltecontain(
      textStyle: textStyle,
    );
  }

  Widget addtilesize(TextStyle textStyle) {
    return Createmaintitle(
      textStyle: textStyle,
    );
  }
}

class Ingtiltecontain extends StatelessWidget {
  const Ingtiltecontain({
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
