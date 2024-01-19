import 'package:flutter/material.dart';
import 'buttons.dart';
import 'built_buttons.dart';

class Builtredirect extends StatelessWidget {
  const Builtredirect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ListButton(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: MydropdownButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
