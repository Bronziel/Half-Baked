import 'package:flutter/material.dart';
import 'built_buttons.dart';

class Builtredirect extends StatelessWidget {
  const Builtredirect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 500,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListButton(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 500,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: MydropdownButton(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
