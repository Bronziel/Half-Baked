import 'package:flutter/material.dart';

///import 'learn_json togheter.txt';
import '../../components/currents/stepholder/prog_ui.dart';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              //Mine(),
              Builtbyme(),
              //Mine2(),
            ],
          ),
          Row(
            children: [
              SizedBox(
                child: Text('hello'),
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
