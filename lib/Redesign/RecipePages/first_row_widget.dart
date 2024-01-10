import 'package:flutter/material.dart';
import 'ComponentsRedesign.dart';
import 'StackedTiles.dart';
import 'imagesclass.dart';

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Widht40wallWidget(),
        const IntroductionWidget(),
        const Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}

class MainImagePlusBoxes extends StatelessWidget {
  const MainImagePlusBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            height: 400,
            width: 1085,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Define the border radius here
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Same radius as Card
                child: Image.asset(
                  'images/new/kebabrulle.jpg',
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              // Add other properties of Card if needed
            ),
          ),
          const Width20StandardWidget(),
          Column(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Define the border radius here
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Same radius as Card
                    child: Image.asset(
                      'images/new/kebabrulle.jpg',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
              const Height40StandardWidget(),
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Define the border radius here
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Same radius as Card
                    child: Image.asset(
                      'images/new/kebab1.jpeg',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
              const Height40StandardWidget(),
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Define the border radius here
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Same radius as Card
                    child: Image.asset(
                      'images/new/kebab3.jpg',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
              const Height40StandardWidget(),
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Define the border radius here
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Same radius as Card
                    child: Image.asset(
                      'images/new/kebabrulle.jpg',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 410,
      child: Card(
        color: const Color(0xFF161414),
        child: Column(
          children: [
            Container(
              width: 410,
              height: 75,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff234234),
                width: 1,
              )),
              child: const Stack(
                children: <Widget>[
                  Positioned(
                    top: 11, // Your specified distance from the top
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Kebabrulle',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Color(0xFFFFFFFF), // Corrected color format
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 410,
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff234234),
                width: 1,
              )),
              child: const Row(children: [
                SizedBox(
                  width: 60,
                ),
                SizedBox(
                  width: 280,
                  height: 130,
                  child: Text(
                    'En god Kebab rulle som aldrig gör en Besviken.',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFff),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
              ]),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color(0xff234234),
                  width: 1,
                )),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        PortionsizeCardWidget(),
                        SizedBox(
                          height: 5,
                        ),
                        TimeCard(
                          title: "Prep Time:",
                          time: "300",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TimeCard(
                          title: "Total Time:",
                          time: "450",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconTile(iconName: 'Cow100'),
                        IconTile(iconName: 'Bread100'),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
