import 'dart:convert';

final String jsonStr = jsonEncode({
  "foodsteps": [
    {
      "step2": 1,
      "id": 1,
      "text2": "ibland laggar jag för lite mat",
    },
    {
      "step2": 2,
      "id": 2,
      "text2": "vrf finns inte det så mkt mat",
    }
  ],
  "foodsteps2": [
    {
      "step2": 2,
      "id": 1,
      "text2": "ibland laggar jag för lite mat",
    },
    {
      "step2": 2,
      "id": 2,
      "text2": "vrf finns inte det så mkt mat",
    }
  ]
});

final multijson = jsonDecode(jsonStr);

final List<dynamic> foodsteps = multijson['foodsteps'];
final List<Multiples> foodstepsResults =
    foodsteps.map((item) => Multiples.fromjson(item)).toList();

final List<dynamic> foodsteps2 = multijson['foodsteps2'];
final List<Multiples> foodsteps2Results =
    foodsteps2.map((item) => Multiples.fromjson(item)).toList();

//final combinedResults = [...foodstepsResults, ...foodsteps2Results];

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

  factory Multiples.fromjson(Map<String, dynamic> json) {
    return Multiples(
      step2: json['step2'],
      id: json['id'],
      text2: json['text2'],
    );
  }
}
