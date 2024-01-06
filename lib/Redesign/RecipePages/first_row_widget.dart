import 'package:flutter/material.dart';

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 40,
        ),
        SizedBox(
          height: 400,
          width: 410,
          child: Card(
              // Add other properties of Card if needed
              ),
        ),
        SizedBox(
          width: 20,
        ),
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
        SizedBox(
          width: 20,
        ),
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
            SizedBox(
              height: 40,
            ),
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
            SizedBox(
              height: 40,
            ),
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
            SizedBox(
              height: 40,
            ),
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
