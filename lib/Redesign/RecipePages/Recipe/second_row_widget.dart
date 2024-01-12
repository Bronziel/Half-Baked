import 'package:flutter/material.dart';

import '../../components/ComponentsRedesign.dart';
import '../../components/sizedboxes.dart';
import '../../components/sizedboxes.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Widht40wallWidget(),
        RecipeListCard(),
        const Width20StandardWidget(),
        StepsWidget(),
      ],
    );
  }
}

class StepsWidget extends StatefulWidget {
  final List<String> steps = [
    // Populate this list with your step descriptions
    '1:mix cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv, cream cheese until smooth. Scrape Mixa den tills flytig inte så fast. Skrapa med en bakkniv',
    '2:add sugar. mix. scrape. Lägg till socker i mixa rejält. Sen skrapa',
    '3:add eggs one at a time. Scrape. Bland med skrapa. Försiktigt och långsamt ett ägg i taget inte mixa',
    '4:add cream/vispgrädde  and vanill//vanila extract mix and scrape',
    '5:Krossa kakorna/brownies. Koka up smör. Lägg  i lite smör i taget. Du vill att smulorna sticker ihop men krossa lätt när du trycket',
    '6:pressa  mixen av botten av formen. Häll sedan i färdiga cream mixen.',
    '7:Step 7 Description',
    '8:Step 8 Description',
    '9:Step 9 Description',
    '10:Step 10 Description',
    '11:Step 7 Description',
    '12:Step 8 Description',
    '13:Step 9 Description',
    '14:Step 10 Description',

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
    // Splitting steps into two lists for left and right columns
    final leftColumnSteps = <String>[];
    final rightColumnSteps = <String>[];

    for (var i = 0; i < widget.steps.length; i++) {
      if (i % 2 == 0) {
        leftColumnSteps.add(widget.steps[i]);
      } else {
        rightColumnSteps.add(widget.steps[i]);
      }
    }

    return SizedBox(
      width: 1200,
      height: 474,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
          children: [
            buildStepsColumn(leftColumnSteps, context, 0),
            const VerticalDivider(
              color: Color(0xFFFFFFFF),
              indent: 20,
              width: 40,
              endIndent: 20,
            ),
            buildStepsColumn(rightColumnSteps, context, leftColumnSteps.length),
          ],
        ),
      ),
    );
  }

  Widget buildStepsColumn(
      List<String> steps, BuildContext context, int offset) {
    return Expanded(
      child: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          int actualIndex = index + offset;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Set your desired border color
                width: 1, // Set your desired border width
              ),
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set your desired border color
                    width: 1, // Set your desired border width
                  ),
                ),
                child: Text(
                  '${actualIndex + 1}',
                  style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    color: Color(0xFF0922FD),
                  ),
                ),
              ),
              title: Text(
                steps[index],
                style: const TextStyle(
                  fontFamily: 'Paprika',
                  fontSize: 24,
                  color: Color(0xFF000000),
                ),
              ),
              trailing: Checkbox(
                value: checkedStates[actualIndex],
                onChanged: (bool? newValue) {
                  setState(() {
                    checkedStates[actualIndex] = newValue ?? false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

/*class MyListTile extends StatefulWidget {
  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool isChecked = false; // initial state of the checkbox

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '1',
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 40,
          color: Color(0xFF0922FD),
        ),
      ),
      title: Text(
        'Börja med att slå sönder 3 ägg. Vispa Sedan ihop äggen i en bunke',
        style: TextStyle(
          fontFamily: 'Paprika',
          fontSize: 24,
          color: Color(0xFF000000),
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            isChecked = newValue ?? false;
          });
        },
      ),
    );
  }
} */

class RecipeListCard extends StatelessWidget {
  const RecipeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410,
      height: 463,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              const IngMainTile(),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    IngredientTile(
                      label: "Kebabkött",
                      quantity: "500",
                      unit: "ml",
                    ),

                    IngredientTile(
                      label: "Kebabkött",
                      quantity: "500",
                      unit: "ml",
                    ),

                    // Add more children as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientTile extends StatelessWidget {
  final String label; // First parameter
  final String quantity; // Second parameter
  final String unit; // Third parameter

  // Update the constructor to accept three parameters
  const IngredientTile({
    super.key,
    required this.label,
    required this.quantity,
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
      child: Row(
        // Removed const since we are using dynamic values now
        children: [
          const SizedBox(width: 16),
          Text(label, style: textStyle), // Use the label parameter
          Text(':', style: textStyle),
          const SizedBox(width: 20),
          Text(quantity, style: textStyle), // Use the quantity parameter
          const SizedBox(width: 3),
          Text(unit, style: textStyle), // Use the unit parameter
        ],
      ),
    );
  }
}

class IngMainTile extends StatelessWidget {
  const IngMainTile({
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
      width: 410,
      color: const Color(0xFFD9D9D9),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Image.asset('images/new/icons/cart.png'),
          const SizedBox(width: 82),
          const Text("Ingridients", style: textStyle),
          const SizedBox(width: 82),
          Image.asset('images/new/icons/cart.png'),
        ],
      ),
    );
  }
}
