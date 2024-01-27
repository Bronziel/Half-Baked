import 'package:flutter/material.dart';

import '../../building/building.dart';

class BuildingActiveButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const BuildingActiveButton({
    super.key,
    this.buttonText = 'Building Active',
    this.buttonColor = const Color.fromARGB(255, 193, 225, 12),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Building()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}
