import 'package:flutter/material.dart';

class IngTile extends StatelessWidget {
  final String label; // First parameter
  final String amount;
  final String unit;
  final int index;

  // Third parameter

  // Update the constructor to accept three parameters
  const IngTile({
    super.key,
    // Initialize key
    required this.label,
    required this.amount,
    required this.unit,
    required this.index, // Initialize index
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white, // Set your desired color here
    );

    return Createingcontain(
        index: index,
        label: label,
        textStyle: textStyle,
        amount: amount,
        unit: unit);
  }
}

class Createingcontain extends StatelessWidget {
  const Createingcontain({
    super.key,
    required this.index,
    required this.label,
    required this.textStyle,
    required this.amount,
    required this.unit,
  });

  final int index;
  final String label;
  final TextStyle textStyle;
  final String amount;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      color: const Color(0xff161414),
      child: SizedBox(
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: ReorderableDragStartListener(
                index: index,
                child: IconButton(
                  onPressed: () {
                    print('menue clicked');
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 233, 228, 228),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 5,
                left: 45,
                child: Text('$label:',
                    style: textStyle)), // Use the label parameter
            Positioned(
                top: 5,
                left: 300,
                child: Text('$amount $unit',
                    style: textStyle)), // Use the quantity parameter
            // Use the unit parameter
            const Positioned(
              top: 5,
              right: 5,
              child: Row(
                children: [Editcontainer(), Deletecontainer()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Deletecontainer extends StatelessWidget {
  const Deletecontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.delete, size: 24),
      color: const Color.fromARGB(255, 233, 228, 228),
      // Plus icon
      onPressed: () {
        print('delete button');
        // Add your action for this button
      },
    );
  }
}

class Editcontainer extends StatelessWidget {
  const Editcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.edit, size: 24),
      color: const Color.fromARGB(255, 233, 228, 228),
      // Plus icon
      onPressed: () {
        print('Edit clicked');
        // Add your action for this button
      },
    );
  }
}
