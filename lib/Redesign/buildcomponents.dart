import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'RecipePages/ComponentsRedesign.dart';
import 'RecipePages/imagesclass.dart';
import 'doneshowcase.dart';

class BuildComponentPage extends StatelessWidget {
  const BuildComponentPage({Key? key}) : super(key: key);

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
              TimeTIlesshowcase(),
              RowOfIcons80(),
              CalorieCardWidget(),
              CaloriecardStackedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CaloriecardStackedWidget extends StatelessWidget {
  const CaloriecardStackedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      width: 585,
      child: Card(
        color: Color(0xFFF13030),
      ),
    );
  }
}

class CalorieCardWidget extends StatelessWidget {
  const CalorieCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 585,
      height: 255,
      child: Card(
        color: Color(0xFFF13030),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/kals/fire.png')
              ],
            ),
            Row(),
            Row(),
          ],
        ),
      ),
    );
  }
}
