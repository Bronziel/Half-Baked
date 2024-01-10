import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../RecipePages/ComponentsRedesign.dart';
import '../RecipePages/imagesclass.dart';
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
              Row(
                children: [
                  CalorieCardWidget(),
                  CaloriecardStackedWidget(),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Containerkals(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Containerkals extends StatelessWidget {
  const Containerkals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 585,
      height: 255,
      decoration: const BoxDecoration(
        color: Color(0xFFF13030),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(children: [
        const SizedBox(
          height: 45,
        ),
        Row(
          children: [
            const SizedBox(
              width: 45,
            ),
            Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff234234),
                width: 1,
              )),
              child: Image.asset(
                'images/kals/fire.png',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}

class CaloriecardStackedWidget extends StatelessWidget {
  const CaloriecardStackedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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
        color: const Color(0xFFF13030),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 45,
                    ),
                    Image.asset('images/kals/fire.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Calories',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      width: 211,
                    ),
                    Image.asset('images/kals/cheked.png'),
                  ],
                ),
              ),
              const Row(),
              const Row(),
            ],
          ),
        ),
      ),
    );
  }
}
