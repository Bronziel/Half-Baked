import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    super.key,
    required this.label,
    required this.textStyle,
    required this.amount,
    required this.unit,
  });

  final String label;
  final TextStyle textStyle;
  final String amount;
  final String unit;

  @override
  Widget build(BuildContext context) {
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
