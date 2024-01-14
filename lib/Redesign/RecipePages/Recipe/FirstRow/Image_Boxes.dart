import 'package:flutter/material.dart';
import '../../../components/components_redesign.dart';
import '../../../components/sizedboxes.dart';
import '../../../components/sizedboxes.dart';

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
                  'images/new/webb.jpg',
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
