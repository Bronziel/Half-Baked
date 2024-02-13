import 'package:flutter/material.dart';

///import 'learn_json togheter.txt';
import '../../components/currents/stepholder/prog_ui.dart';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              //Mine(),

              const Builtbyme(),

              //Mine2(),
            ],
          ),
          const Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
