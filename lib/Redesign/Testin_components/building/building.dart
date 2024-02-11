import 'package:flutter/material.dart';
import 'checkbox.dart';

///import 'learn_json togheter.txt';
import 'progs/prog_ui.dart';

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
              StepsWidget2(steps2: steps2),
              const Builtbyme(),
              const Boxwithtext(),
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

class StepsWidget2 extends StatefulWidget {
  final List<String> steps2;
  StepsWidget2({super.key, required this.steps2});

  @override
  State<StepsWidget2> createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget2> {
  late List<bool> checkedStates;

  @override
  void initState() {
    super.initState();
    // Initialize the checked states for each step
    checkedStates = List.generate(widget.steps2.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 475,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ListView.builder(
          itemCount: widget.steps2.length,
          itemBuilder: (context, index) {
            return buildStepItem(widget.steps2[index], index);
          },
        ),
      ),
    );
  }

  Widget buildStepItem(String step, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: Text(
          '${index + 1}:',
          style: const TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          step,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            color: Color(0xFF000000),
          ),
        ),
        trailing: Checkbox(
          value: checkedStates[index],
          onChanged: (bool? newValue) {
            setState(() {
              checkedStates[index] = newValue ?? false;
            });
          },
        ),
      ),
    );
  }
}

//byg steps list items först sen bygg resten

class Steps {
  final String text;
  final int id; //for key pair value
  final int idclass; //for steps class like prepping meat etc
  final int idheader;

  Steps({
    required this.text,
    required this.id,
    required this.idclass,
    required this.idheader,
  });
}

final List<Steps> _steps = [
  Steps(
    text: 'maricha sås',
    id: 1,
    idclass: 2,
    idheader: 2,
  ),

  // ... more items
];

class Header {
  final int titelid;
  final String title; //to know where it is placed so number 1 highest up

  Header({required this.titelid, required this.title});
}

final List<Header> _header = [
  Header(
    title: 'maricha sås',
    titelid: 1,
  ),

  // ... more items
];

//old list
final List<String> steps2 = [
  // Populate this list with your step descriptions
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'add sugar. mix. scrape. Lägg till socker i mixa rejält. Sen skrapa',
  'add eggs one at a time. Scrape. Bland med skrapa. Försiktigt och långsamt ett ägg i taget inte mixa',
  'add cream/vispgrädde  and vanill//vanila extract mix and scrape',
  'Krossa kakorna/brownies. Koka up smör. Lägg  i lite smör i taget. Du vill att smulorna sticker ihop men krossa lätt när du trycket',
  'pressa  mixen av botten av formen. Häll sedan i färdiga cream mixen.',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
  'mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',

  // Add more steps as needed
];
