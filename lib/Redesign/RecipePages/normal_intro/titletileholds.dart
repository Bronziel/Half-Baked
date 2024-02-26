import 'package:flutter/material.dart';
import '../../components/currents/sharedtitle.dart';

class DisplaynormalBasictitle extends StatelessWidget {
  final String title;
  const DisplaynormalBasictitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 75,
      decoration: jajsjs2(),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 11, // Your specified distance from the top
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Titlewierd(
                title: title,
                //'KebabRulle'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
