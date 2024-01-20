import 'package:flutter/material.dart';

class CreateRecipeListCard2 extends StatelessWidget {
  const CreateRecipeListCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 450,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Column(
            children: [
              CreateIngMainTile(),
              Expanded(
                child: ReorderIngridientlist(),
              ),
            ],
          ),
        ),
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
    Item(label: 'maricha sås', amount: '1000', unit: 'ml'),
    Item(label: 'Jordgubbssylt', amount: '2000', unit: 'tsk'),
    // ... more items
  ];
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      buildDefaultDragHandles: false,
      children: List.generate(_items.length, (index) {
        Item item = _items[index];
        return Tilebbs(
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

class CreateIngMainTile extends StatelessWidget {
  const CreateIngMainTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF000000), // Set your desired color here
    );

    return Container(
      height: 50,
      width: 500,
      color: const Color(0xFFD9D9D9),
      child: const Stack(
        children: [
          Positioned(
            left: 20,
            top: 10,
            child: carticon(),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text("Ingridients", style: textStyle),
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: carticon(),
          ),
        ],
      ),
    );
  }
}

class carticon extends StatelessWidget {
  const carticon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/new/icons/cart.png');
  }
}

class Tilebbs extends StatelessWidget {
  final String label; // First parameter
  final String amount;
  final String unit;
  final int index;

  // Third parameter

  // Update the constructor to accept three parameters
  const Tilebbs({
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
