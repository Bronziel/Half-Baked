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
            PortionsizedStackWidget(),
            PrepTimeStack(),
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

class TimeCard extends StatelessWidget {
  final String title;
  final String time;

  const TimeCard({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
          children: [
            const SizedBox(width: 9),
            Image.asset('images/new/icons/clock.png'),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 1),
            const Text(
              "min",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PortionsizeCardWidget extends StatelessWidget {
  const PortionsizeCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 50,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
          children: [
            const SizedBox(width: 7.2),
            Image.asset('images/new/icons/portion.png'),
            const SizedBox(width: 4.99),
            const Text(
              "Portionsize:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 9),
            const Text(
              "12",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 6),
            Image.asset('images/new/icons/man.png'),
          ],
        ),
      ),
    );
  }
}

class PortionsizedStackWidget extends StatelessWidget {
  const PortionsizedStackWidget({
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
        const Positioned(
          top: 10,
          left: 7.2,
          child: PortionsizeIconTile(),
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
          child: ManIconTile(),
        ),
        // Include your other Containers within the Stack
        // Make sure to position them or size them as needed
      ],
    );
  }
}

class PrepTimeStack extends StatelessWidget {
  const PrepTimeStack({
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
        const Positioned(
          top: 10,
          left: 9,
          child: ClockIconTile(),
        ),
        const Positioned(
          top: 10,
          left: 44, // Position your text or add alignment as needed
          child: Text(
            "Prep Time:",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 178,
          child: Text(
            "300",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 230,
          child: Text(
            "min",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // Include your other Containers within the Stack
        // Make sure to position them or size them as needed
      ],
    );
  }
}

class PortionsizeIconTile extends StatelessWidget {
  const PortionsizeIconTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/new/icons/portion.png',
      width: 44,
      height: 30,
    );
  }
}

class ManIconTile extends StatelessWidget {
  const ManIconTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/new/icons/man.png',
      width: 11.75,
      height: 30,
    );
  }
}

class ClockIconTile extends StatelessWidget {
  const ClockIconTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/new/icons/clock.png',
      width: 30,
      height: 30,
    );
  }
}
