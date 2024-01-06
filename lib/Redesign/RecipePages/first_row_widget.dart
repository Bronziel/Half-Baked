import 'package:flutter/material.dart';
import 'ComponentsRedesign.dart';

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
    return SizedBox(
      height: 400,
      width: 410,
      child: Card(
        color: const Color(0xFFFFA500),
        child: Column(
          children: [
            PortionsizedWidget(),
          ],
        ),
      ),
    );
  }
}

class PortionsizedWidget extends StatelessWidget {
  const PortionsizedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 290,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffd9d9d9),
          ),
        ),
        Positioned(
          top: 10,
          left: 7.2,
          child: Image.asset(
            'images/new/icons/portion.png',
            width: 44,
            height: 30,
          ),
        ),
        const Positioned(
          top: 10,
          left: 56, // Position your text or add alignment as needed
          child: Text(
            "Portionsize:",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 206,
          child: Text(
            "12",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 243,
          child: Image.asset(
            'images/new/icons/man.png',
            width: 11.75,
            height: 30,
          ),
        ),
        // Include your other Containers within the Stack
        // Make sure to position them or size them as needed
      ],
    );
  }
}
