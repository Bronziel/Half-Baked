import 'package:flutter/material.dart';
import '../showcase/showcase.dart';
import 'Built_Central/built_redirected.dart';
import 'Building _Central/building_redirected.dart';
import '../showcase/showcasestyle.dart';

class ShowcaseButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const ShowcaseButton({
    super.key,
    this.buttonText = 'ShowCase',
    this.buttonColor = const Color.fromARGB(255, 189, 12, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShowcasePage()),
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

class Styleshowcasepageredirect extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const Styleshowcasepageredirect({
    super.key,
    this.buttonText = 'StyleShowcase',
    this.buttonColor = const Color.fromARGB(255, 214, 225, 12),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const styleshowcasepage()),
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

class BuildingButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const BuildingButton({
    super.key,
    this.buttonText = 'Building Components',
    this.buttonColor = const Color.fromARGB(255, 47, 237, 17),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BuildingRedirect()),
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

class BuiltButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const BuiltButton({
    super.key,
    this.buttonText = 'Built Components',
    this.buttonColor = const Color.fromARGB(255, 225, 12, 40),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Builtredirect()),
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
