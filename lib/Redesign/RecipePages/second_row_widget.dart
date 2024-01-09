import 'package:flutter/material.dart';

import 'ComponentsRedesign.dart';

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

class StepsWidget extends StatelessWidget {
  final List<String> steps = [
    // Populate this list with your step descriptions
    'Step 1 Description',
    'Step 2 Description',
    // Add more steps as needed
  ];

  StepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Splitting steps into two lists for left and right columns
    final leftColumnSteps = <String>[];
    final rightColumnSteps = <String>[];

    for (var i = 0; i < steps.length; i++) {
      if (i % 2 == 0) {
        leftColumnSteps.add(steps[i]);
      } else {
        rightColumnSteps.add(steps[i]);
      }
    }

    return SizedBox(
      width: 1200,
      height: 474,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: Row(
          children: [
            buildStepsColumn(leftColumnSteps),
            const VerticalDivider(
              color: Color(0xFFFFFFFF),
              indent: 20,
              width: 40,
              endIndent: 20,
            ),
            buildStepsColumn(rightColumnSteps),
          ],
        ),
      ),
    );
  }

  Widget buildStepsColumn(List<String> steps) {
    return Expanded(
      child: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              '${index + 1}',
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
              ),
            ),
            title: Text(
              steps[index],
              style: const TextStyle(
                fontFamily: 'Paprika',
                fontSize: 24,
              ),
            ),
            // Add other styling or elements as needed
          );
        },
      ),
    );
  }
}

class MyListTile extends StatefulWidget {
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
}

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
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
                    IngridientTile(),
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

class IngridientTile extends StatelessWidget {
  const IngridientTile({
    super.key,
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
      child: const Row(
        children: [
          SizedBox(width: 16),
          Text("Kebabkött:", style: textStyle),
          SizedBox(width: 20),
          Text("500", style: textStyle),
          SizedBox(width: 3),
          Text("ml", style: textStyle),
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
