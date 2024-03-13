import 'package:flutter/material.dart';

class CreateIngredientTile extends StatelessWidget {
  final String label; // First parameter
  final String amount; // Second parameter
  final String unit; // Third parameter
  final bool shownormal;
  final int? index; // Optional parameter for index
  final VoidCallback? onPressedDelete;
  final VoidCallback? onPressedEdit;

  // Update the constructor to accept three parameters
  const CreateIngredientTile({
    super.key,
    required this.shownormal,
    required this.label,
    required this.amount,
    required this.unit,
    this.onPressedDelete,
    this.onPressedEdit,
    this.index, // It's optional and can be null
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white, // Set your desired color here
    );

    return shownormal
        ? ingcontains(textStyle)
        : createingcontains(textStyle, index);
  }

  Widget ingcontains(TextStyle textStyle) {
    return Ingcontain(
        label: label, textStyle: textStyle, amount: amount, unit: unit);
  }

  Widget createingcontains(TextStyle textStyle, int? index) {
    // Ensure index is not null or provide a default value
    int safeIndex = index ?? 0; // Default value or handle appropriately

    return Createingcontain(
        onPressedDelete: onPressedDelete,
        onPressedEdit: onPressedEdit,
        index: safeIndex,
        label: label,
        textStyle: textStyle,
        amount: amount,
        unit: unit);
  }
}

class Ingcontain extends StatelessWidget {
  const Ingcontain({
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

//new

class Createingcontain extends StatelessWidget {
  const Createingcontain({
    super.key,
    required this.onPressedDelete,
    required this.onPressedEdit,
    required this.index,
    required this.label,
    required this.textStyle,
    required this.amount,
    required this.unit,
  });
  final VoidCallback? onPressedDelete;
  final VoidCallback? onPressedEdit;
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
            Positioned(
              top: 5,
              right: 5,
              child: Row(
                children: [
                  Editcontainer(onPressedEdit: onPressedEdit),
                  Deletecontainer(
                    onPressedDelete: onPressedDelete,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Deletecontainer extends StatelessWidget {
  final VoidCallback? onPressedDelete;
  const Deletecontainer({
    required this.onPressedDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.delete, size: 24),
      color: const Color.fromARGB(255, 233, 228, 228),
      // Plus icon
      onPressed: onPressedDelete ?? () {},
    );
  }
}

class Editcontainer extends StatelessWidget {
  final VoidCallback? onPressedEdit;
  const Editcontainer({
    required this.onPressedEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.edit, size: 24),
      color: const Color.fromARGB(255, 233, 228, 228),
      // Plus icon
      onPressed: onPressedEdit ?? () {},
    );
  }
}
