import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewDesignPage extends StatelessWidget {
  const NewDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
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
                            borderRadius: BorderRadius.circular(
                                10), // Same radius as Card
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
                            borderRadius: BorderRadius.circular(
                                10), // Same radius as Card
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
                            borderRadius: BorderRadius.circular(
                                10), // Same radius as Card
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
                            borderRadius: BorderRadius.circular(
                                10), // Same radius as Card
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 410,
                    height: 463,
                    child: Card(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 1175,
                    height: 474,
                    child: Card(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
