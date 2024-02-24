import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

//bestick icon
class BestickSvgIcon extends StatelessWidget {
  const BestickSvgIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/bestickvit.svg',
      width: 62, // Set the width of the SVG
      height: 54.63, // Set the height of the SVG
    );
  }
}
