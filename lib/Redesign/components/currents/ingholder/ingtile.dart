import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final String label; // First parameter
  final String amount; // Second parameter
  final String unit; // Third parameter

  // Update the constructor to accept three parameters
  const IngredientTile({
    super.key,
    required this.label,
    required this.amount,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white, // Set your desired color here
    );

    return Container(
      height: 50,
      width: 410,
      color: const Color(0xff161414),
      child: Row(
        // Removed const since we are using dynamic values now
        children: [
          const SizedBox(width: 16),
          Text('$label:', style: textStyle), // Use the label parameter
          const SizedBox(width: 20),
          Text('$amount$unit', style: textStyle), // Use the unit parameter
        ],
      ),
    );
  }
}

//new
