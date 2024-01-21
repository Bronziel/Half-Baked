import 'package:flutter/material.dart';

class IngTitleTile extends StatelessWidget {
  const IngTitleTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF000000), // Set your desired color here
    );

    return Container(
      height: 50,
      width: 500,
      color: const Color(0xFFD9D9D9),
      child: const Stack(
        children: [
          Positioned(
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
              child: Text("Ingridients", style: textStyle),
            ),
          ),
          Positioned(
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
