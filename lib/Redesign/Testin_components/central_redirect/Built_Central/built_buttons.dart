import 'package:flutter/material.dart';
import '../../built/dropdown.dart';
import '../../built/mydropdown.dart';
import '../../built/listviewreorder.dart';
import '../../built/myreorder.dart';

class ListButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const ListButton({
    super.key,
    this.buttonText = 'Dropdown  Menue',
    this.buttonColor = const Color.fromARGB(255, 12, 122, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DropdownMenuExample()),
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

class MydropdownButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const MydropdownButton({
    super.key,
    this.buttonText = 'My drop  down menue',
    this.buttonColor = const Color.fromARGB(255, 12, 122, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Mymenue()),
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

class MyReord extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const MyReord({
    super.key,
    this.buttonText = 'MyReorderlistview',
    this.buttonColor = const Color.fromARGB(255, 12, 122, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CreateRecipeListCard2()),
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

class Reord extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const Reord({
    super.key,
    this.buttonText = 'Reorderlistview',
    this.buttonColor = const Color.fromARGB(255, 12, 122, 225),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReorderableApp()),
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
