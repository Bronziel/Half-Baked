import 'package:flutter/material.dart';
import '../../../components/spacing/sizedboxes.dart';
import '../../../components/currents/ingholder/ingboxshared.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Widht40wallWidget(),
        const RecipeListCard(other: true),
        const Width20StandardWidget(),
        StepsWidget(),
      ],
    );
  }
}

class StepsWidget extends StatefulWidget {
  final List<String> steps = [
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

  StepsWidget({super.key});

  @override
  State<StepsWidget> createState() => _StepsWidgetState();
}

class _StepsWidgetState extends State<StepsWidget> {
  late List<bool> checkedStates;

  @override
  void initState() {
    super.initState();
    // Initialize the checked states for each step
    checkedStates = List.generate(widget.steps.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200,
      height: 475,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ListView.builder(
          itemCount: widget.steps.length,
          itemBuilder: (context, index) {
            return buildStepItem(widget.steps[index], index);
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
        leading: SizedBox(
          child: Text(
            '${index + 1}:',
            style: const TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40,
              color: Colors.black,
            ),
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
