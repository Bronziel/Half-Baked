import 'package:flutter/material.dart';

import '../building/building.dart';
import '../../styles_test/compos/buttone_template.dart';

//make  baseplate to copy
class BuildingRedirect extends StatelessWidget {
  const BuildingRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ButtonTemplate(
                landingspace: Building(),
                buttonText: "Building Active",
                buttonColor: Color.fromARGB(255, 193, 225, 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
