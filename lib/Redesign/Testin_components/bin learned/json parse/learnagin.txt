import 'dart:convert';
import 'package:flutter/material.dart';

// This line sorts the foodsteps2Results list of Multiples objects by their id.
//final combinedResults = [...foodstepsResults, ...foodsteps2Results];
// Assuming foodsteps2Results is already sorted and populated

//trubbel shoot
// Now you have two lists, foodstepsResults and foodsteps2Results, containing Multiples instances.

class Multiples {
  final int step2;
  final int id;
  final String text2;

  Multiples({
    required this.step2,
    required this.id,
    required this.text2,
  });

  factory Multiples.fromJson(Map<String, dynamic> json) {
    return Multiples(
      step2: json['step2'],
      id: json['id'],
      text2: json['text2'],
    );
  }
}

class Displayedtexts extends StatelessWidget {
  const Displayedtexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          Text(''),
        ],
      ),
    );
  }
}

class Okeyyes extends StatefulWidget {
  const Okeyyes({super.key});

  @override
  State<Okeyyes> createState() => _OkeyyesState();
}

class _OkeyyesState extends State<Okeyyes> {
  late List<Multiples> foodsteps2Results;
  List<Multiples> foodstepsResults = [];
  @override
  void initState() {
    super.initState();
    mydatas();
  }

  void mydatas() {
    final String jsonStr = jsonEncode({
      "foodsteps": [
        {"step2": 1, "id": 1, "text2": "ibland laggar jag för lite mat"},
        {"step2": 2, "id": 2, "text2": "vrf finns inte det så mkt mat"},
      ],
      "foodsteps2": [
        {"step2": 2, "id": 1, "text2": "ibland laggar jag för lite mat"},
        {"step2": 2, "id": 2, "text2": "vrf finns inte det så mkt mat"},
      ]
    });
    final multijson = jsonDecode(jsonStr);

    // Update the state variables directly
    setState(() {
      foodstepsResults = multijson['foodsteps']
          .map<Multiples>((item) => Multiples.fromJson(item))
          .toList();
      foodstepsResults.sort((a, b) => a.id.compareTo(b.id));

      foodsteps2Results = multijson['foodsteps2']
          .map<Multiples>((item) => Multiples.fromJson(item))
          .toList();
      foodsteps2Results.sort((a, b) => a.id.compareTo(b.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: ListView.builder(
        itemCount: foodstepsResults.length,
        itemBuilder: (context, index) {
          final item = foodstepsResults[index];
          return ListTile(
            title: Text(item.text2),
            subtitle: Text('Step: ${item.step2}, ID: ${item.id}'),
          );
        },
      ),
    );
  }
}
