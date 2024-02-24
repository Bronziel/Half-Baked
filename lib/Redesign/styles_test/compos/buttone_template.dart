import 'package:flutter/material.dart';

class ButtonTemplate extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Widget landingspace;
  const ButtonTemplate({
    required this.landingspace,
    required this.buttonText,
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => landingspace),
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
      ),
    );
  }
}
