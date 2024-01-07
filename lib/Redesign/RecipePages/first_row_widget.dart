import 'package:flutter/material.dart';
import 'ComponentsRedesign.dart';
import 'StackedTiles.dart';

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
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      width: 410,
      child: Card(
        color: Color(0xFFFFA500),
        child: Column(
          children: [
            PortionsizedStackWidget(),
            TimeStack(
              title: "Prep Time:",
              time: "300",
            ),
            TimeStack(
              title: "Total Time:",
              time: "450",
              titleLeftPosition: 50, // Custom position if needed
              timeLeftPosition: 184, // Custom position if needed
            ),
            PortionsizeCardWidget(),
            TimeCard(
              title: "Prep Time:",
              time: "300",
            ),
            TimeCard(
              title: "Total Time:",
              time: "450",
            ),
          ],
        ),
      ),
    );
  }
}
