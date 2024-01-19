import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Listing(),
    );
  }
}

class Listing extends StatefulWidget {
  const Listing({super.key});

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  // Sample data
  final List<Map<String, String>> _items = [
    {'label': 'Item 1', 'amount': '100', 'unit': 'kg'},
    {'label': 'Item 2', 'amount': '200', 'unit': 'g'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: List.generate(_items.length, (index) {
        Map<String, String> item = _items[index];
        return EditingTile(
          key: ValueKey('item_${item['label']}'),
          label: item['label']!,
          amount: item['amount']!,
          unit: item['unit']!,
        );
      }),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}

class EditingTile extends StatelessWidget {
  final String label; // First parameter
  final String amount;
  final String unit;
  // Third parameter

  // Update the constructor to accept three parameters
  const EditingTile({
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
      child: SizedBox(
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            IconButton(
              onPressed: () {
                print('menue clicked');
              },
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 233, 228, 228),
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
