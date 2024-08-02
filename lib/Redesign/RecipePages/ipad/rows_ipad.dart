import 'package:fb2/Redesign/components/currents/stepholder/Progress.dart';
import 'package:flutter/material.dart';

import '../../components/currents/imgholders/normal/image_boxes.dart';
import '../../components/currents/stepholder/prog_ui.dart';
import '../../components/styles/ingboxshared.dart';
import '../../components/styles/spacing/sizedboxes.dart';
import '../base_recipe.dart';
import '../normal_intro/introduction_box.dart';

class NewDesignPageIpad extends StatelessWidget {
  const NewDesignPageIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidgetIpad(),
              Height20StandardWidget(),
              SecondRowWidgetIpad(),
            ],
          ),
        ),
      
    );
  }
}

class FirstRowWidgetIpad extends StatelessWidget {
  const FirstRowWidgetIpad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        Intro(),
        Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}

class SecondRowWidgetIpad extends StatelessWidget {
  const SecondRowWidgetIpad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        RecipeListCard(other: true),
        Width20StandardWidget(),
        Expanded(child: BuiltbymeIpad()),
      ],
    );
  }
}

class BuiltbymeIpad extends StatelessWidget {
  const BuiltbymeIpad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      
       child:Padding(
         padding: EdgeInsets.all(8.0),
         child: Card(
          color: Color(0xffd9d9d9),
          child: Column(
            children: [
              StepsBigtileIpad(),
              Displaytestlist(),
            ],
          ),
               ),
       ),
    );
  }
}

class StepsBigtileIpad extends StatelessWidget {
  const StepsBigtileIpad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 20,
              child: SizedBox(
                child: Text('Steps',
                    style: Stepstyleformat.stepMainStepTextTile()),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class DisplaytestlistIpad extends StatefulWidget {
  const DisplaytestlistIpad({super.key});

  @override
  State<DisplaytestlistIpad> createState() =>  _DisplaytestlistIpadState();
}

class _DisplaytestlistIpadState extends State<DisplaytestlistIpad> {
  late List<Steps> result = [];
  late List<Head> resulthead = [];
  late List<Combined> idk = [];
  late List<bool> memoryState;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //needs eror hanadling
    result = await Dataset.finshedsteps();
    resulthead = await Dataset.finshedheader();

    //declaring emptylist
    List<Combined> combinedList = [];
    //changing map objects in a loop to map combined objects and adding to list
    for (var headers in resulthead) {
      combinedList.add(
          Combined(header: true, id: headers.step, text: headers.headertext));
    }

    for (var steps in result) {
      combinedList.add(Combined(
          header: false,
          id: steps.stepid,
          text: steps.steptext,
          showid: steps.realstep));
    }
    //use populated list
    List<bool> memoryState = List.generate(combinedList.length, (_) => false);
    // Sort combinedList by hdid and then by step order for non-headers
    combinedList.sort((a, b) {
      int compare = a.id.compareTo(b.id);
      //if compare is equal to 0 and a not header and b not header no usecase

      return compare;
    });
    setState(() {
      idk = combinedList;
      this.memoryState = memoryState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: ListView.builder(
        itemCount: idk.length,
        itemBuilder: (context, index) {
          final item = idk[index];

          if (item.header) {
            // For header items, simply return your HeaderBox widget
            return HeaderBoxIpad(headerText: item.text);
          } else {
            // For step items, pass the current state and callback to Stepbox
            return StepboxIpad(
              steptext: item.text,
              step: item.showid,
              isChecked: memoryState[index], // Pass the current state
              onCheckedChanged: (bool newValue) {
                // Callback to update the state
                setState(() {
                  memoryState[index] = newValue;
                });
              },
            );
          }
        },
      ),
    );
  }
}

class StepboxIpad extends StatefulWidget {
  final String steptext;
  final int step;

  final bool isChecked; // The current state of the checkbox
  final ValueChanged<bool>
      onCheckedChanged; // Callback function to update the state

  const StepboxIpad({
    required this.step,
    required this.steptext,
    //new
    required this.isChecked,
    required this.onCheckedChanged,
    super.key,
  });

  @override
  State<Stepbox> createState() => _BoxwithstepsState();
}

class _BoxwithstepsState extends State<Stepbox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ListTile(
        leading: SizedBox(
          child: Text('${widget.step}:', style: Stepstyleformat.stepNumber()),
        ),
        title: SizedBox(
          child: Text(
            widget.steptext,
            style: Stepstyleformat.stepMainText(widget.isChecked),
          ),
        ),
        trailing: SizedBox(
          child: Checkbox(
            value: widget.isChecked,
            activeColor: Colors.black,
            onChanged: (bool? newBool) {
              if (newBool != null) {
                widget.onCheckedChanged(newBool);
              }
            },
          ),
        ),
      ),
    );
  }
}


class HeaderBoxIpad extends StatelessWidget {
  //headertext string
  //hdid int
  final String headerText;
  const HeaderBoxIpad({
    required this.headerText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          child: Text(headerText, style: Stepstyleformat.stepTitelText()),
        ),
      ),
    );
  }
}