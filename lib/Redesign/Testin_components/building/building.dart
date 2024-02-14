import 'package:flutter/material.dart';
import 'classforpopup.dart';

///import 'learn_json togheter.txt';
import '../../components/currents/stepholder/prog_ui.dart';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              //Mine(),
              Builtbyme(),
              //Mine2(),
            ],
          ),
          Row(
            children: [
              SizedBox(
                child: Addbuttoncontainertest(
                  onPressed: () => DialogUtilstest.showIngPopDialog(context),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Listholder extends StatelessWidget {
  const Listholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class IngPass {
  final String label;
  final String amount;
  final String unit;

  IngPass({required this.label, required this.amount, required this.unit});
}

class Addbuttoncontainertest extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color; // Add a color property

  const Addbuttoncontainertest({
    required this.onPressed,
    super.key,
    this.color = const Color(0xFFCECCCC), // Set default color
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add, size: 24),
      color: color, // Use the color property
      onPressed: onPressed,
    );
  }
}
