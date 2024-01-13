import 'package:flutter/material.dart';
import '../../../components/ComponentsRedesign.dart';

class CreateIntroductionWidget extends StatelessWidget {
  const CreateIntroductionWidget({
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
                  color: const Color.fromARGB(255, 70, 115, 231),
                  width: 1,
                ),
              ),
              //title row
              child: Row(
                children: [
                  const SizedBox(
                    width: 60,
                  ),
                  SizedBox(
                    width: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 213, 6, 164),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          const CreateTitle(
                            Createtitle: 'Add title',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            color: const Color(0xFFCECCCC),
                            icon: const Icon(Icons.add), // Plus icon
                            onPressed: () {
                              // Add your action for this button
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //description big box
            Container(
              width: 410,
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff234234),
                width: 1,
              )),
              child: Row(children: [
                const SizedBox(
                  width: 60,
                ),
                //actualbox with description in it
                SizedBox(
                  width: 280,
                  height: 130,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: const Color.fromARGB(255, 213, 6, 164),
                      width: 2,
                    )),
                    child: Column(
                      children: [
                        const CreateDescription(
                            Createdescription: 'Add a description'),
                        const SizedBox(height: 8),
                        IconButton(
                          color: const Color(0xFFCECCCC),
                          icon: const Icon(Icons.add), // Plus icon
                          onPressed: () {
                            // Add your action for this button
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  width: 60,
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 55,
                ),
                CreateIcontilesBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreateDescription extends StatelessWidget {
  final String Createdescription;
  const CreateDescription({
    super.key,
    this.Createdescription = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Createdescription,
      softWrap: true,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFff),
      ),
    );
  }
}

class CreateTitle extends StatelessWidget {
  final String Createtitle;
  const CreateTitle({
    super.key,
    this.Createtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Createtitle,
      style: const TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 40,
        color: Color(0xFFFFFFFF), // Corrected color format
      ),
    );
  }
}

class CreateIcontilesBox extends StatelessWidget {
  const CreateIcontilesBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: const Color.fromARGB(255, 213, 6, 164),
          width: 2,
        )),
        child: const Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                CreatePortionsizeCardWidget(),
                SizedBox(
                  height: 5,
                ),
                CreateTimeCard(
                  title: "Prep Time:",
                ),
                SizedBox(
                  height: 5,
                ),
                CreateTimeCard(
                  title: "Total Time:",
                ),
              ],
            ),
          ],
        ));
  }
}
