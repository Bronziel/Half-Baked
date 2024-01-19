import 'package:flutter/material.dart';
import 'building_buttons.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Reord(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: BuildingActiveButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
