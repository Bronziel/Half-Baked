import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/sizedboxes.dart';
import 'FirstRow/first_row_widget.dart';
import 'second_row_widget.dart';

class NewDesignPage extends StatelessWidget {
  const NewDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          flexibleSpace: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 400, // Adjust the position as needed
                  child: SvgPicture.asset(
                    'images/bestickvit.svg',
                    width: 62, // Set the width of the SVG
                    height: 54.63, // Set the height of the SVG
                  ),
                ),
                const Text(
                  'HalfBaked',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Color(0xFFFFFFff)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidget(),
              Height20StandardWidget(),
              SecondRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}