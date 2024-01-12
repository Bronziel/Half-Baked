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
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Color.fromARGB(255, 213, 6, 164),
                  width: 2,
                )),
                child: IconButton(
                  color: Color.fromARGB(255, 12, 11, 11),
                  icon: const Icon(Icons.add), // Plus icon
                  onPressed: () {
                    // Add your action for this button
                  },
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
                  child: const Icon(
                    Icons.audiotrack,
                    color: Colors.green,
                    size: 30.0,
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
