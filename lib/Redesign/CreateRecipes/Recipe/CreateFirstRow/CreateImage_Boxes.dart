import 'package:flutter/material.dart';
import '../../../components/ComponentsRedesign.dart';
import '../../../components/sizedboxes.dart';

class CreateMainImagePlusBoxes extends StatelessWidget {
  const CreateMainImagePlusBoxes({
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
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      constraints:
                          BoxConstraints(maxHeight: 100, maxWidth: 100),
                      icon: Icon(Icons.add, size: 24),
                      color: Color.fromARGB(255, 12, 11, 11),
                      // Plus icon
                      onPressed: () {
                        // Add your action for this button
                      },
                    ),
                  ),
                  const Text(
                    'Add Images',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
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
                  child: IconButton(
                    constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                    icon: Icon(Icons.add, size: 24),
                    color: Color.fromARGB(255, 12, 11, 11),
                    // Plus icon
                    onPressed: () {
                      // Add your action for this button
                    },
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
