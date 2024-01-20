import 'package:flutter/material.dart';

class B2 extends StatelessWidget {
  const B2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        child: ReorderIngridientlist(),
      ),
    );
  }
}

class ReorderIngridientlist extends StatefulWidget {
  const ReorderIngridientlist({super.key});

  @override
  State<ReorderIngridientlist> createState() => _ReorderIngridientlistState();
}

class _ReorderIngridientlistState extends State<ReorderIngridientlist> {
  final List<Item> _items = [
    Item(label: 'Item 1', amount: '100', unit: 'kg'),
    Item(label: 'Item 2', amount: '200', unit: 'g'),
    // ... more items
  ];
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(_items.length, (index) {
        Item item = _items[index];
        return EditingTile(
          key: ValueKey(item.label),
          label: item.label,
          amount: item.amount,
          unit: item.unit,
          index: index,
        );
      }),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final Item item = _items.removeAt(oldIndex);

          _items.insert(newIndex, item);
        });
      },
    );
  }
}

class Item {
  final String label;
  final String amount;
  final String unit;

  Item({required this.label, required this.amount, required this.unit});
}

class EditingTile extends StatelessWidget {
  final String label; // First parameter
  final String amount;
  final String unit;
  final int index;

  // Third parameter

  // Update the constructor to accept three parameters
  const EditingTile({
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

    return Container(
      height: 50,
      width: 410,
      color: const Color(0xff161414),
      child: SizedBox(
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            ReorderableDragStartListener(
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
            const SizedBox(width: 16),
            Text(label, style: textStyle), // Use the label parameter
            const Text(':', style: textStyle),
            const SizedBox(width: 20),
            Text(amount, style: textStyle), // Use the quantity parameter
            const SizedBox(width: 3),
            Text(unit, style: textStyle), // Use the unit parameter
            const SizedBox(
              width: 130,
            ),
            IconButton(
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
              icon: const Icon(Icons.edit, size: 24),
              color: const Color.fromARGB(255, 233, 228, 228),
              // Plus icon
              onPressed: () {
                print('Edit clicked');
                // Add your action for this button
              },
            ),
          ],
        ),
      ),
    );
  }
}
