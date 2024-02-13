import 'package:flutter/material.dart';
import 'Progress.dart';

class Builtbyme extends StatelessWidget {
  const Builtbyme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 1200,
      height: 475,
      child: Card(
        color: Color(0xffd9d9d9),
        child: Displaytestlist(),
      ),
    );
  }
}

//need for saving steps.
//need update checkbox crossing over the text
//arrow that minmises list into titel tile
//if  checkboox checked textdecoration line through.
class Displaytestlist extends StatefulWidget {
  const Displaytestlist({super.key});

  @override
  State<Displaytestlist> createState() => _DisplaytestlistState();
}

class _DisplaytestlistState extends State<Displaytestlist> {
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
      if (compare == 0 && !a.header && !b.header) {
        // Assuming you have a way to sort steps when ids are the same
        return a.text.compareTo(b.text); // Or use step order if available
      }
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
      width: 400,
      height: 400,
      child: ListView.builder(
        itemCount: idk.length,
        itemBuilder: (context, index) {
          final item = idk[index];

          if (item.header) {
            // For header items, simply return your HeaderBox widget
            return HeaderBox(headerText: item.text);
          } else {
            // For step items, pass the current state and callback to Stepbox
            return Stepbox(
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

class Combined {
  final int showid;
  final int id;
  final bool header;
  final String text;
  Combined({
    required this.header,
    required this.id,
    required this.text,
    this.showid = 0,
  });
}

class HeaderBox extends StatelessWidget {
  //headertext string
  //hdid int
  final String headerText;
  const HeaderBox({
    required this.headerText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      height: 50,
      width: 400,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: Text(
            headerText,
            style: const TextStyle(
              fontFamily: 'Montserrat Semibold',
              fontWeight: FontWeight.w800, // ExtraBold
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

//genereated a chceklist so it rembers for teh full list
class Stepbox extends StatefulWidget {
  final String steptext;
  final int step;

  final bool isChecked; // The current state of the checkbox
  final ValueChanged<bool>
      onCheckedChanged; // Callback function to update the state

  const Stepbox({
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
            'Step ${widget.step}:',
            style: const TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        title: SizedBox(
          child: Text(
            widget.steptext,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              color: const Color(0xFF000000),
              decoration: widget.isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        trailing: SizedBox(
          child: Checkbox(
            value: widget.isChecked,
            activeColor: Colors.green,
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
//we say list with empty bool values
//we generate the combined list we use this list to see lenght and give automatic value false. 
//we say use 

/* 
so if i understand this correctly first 
it does finished stepss and finishsed headers 
wich both returns  list 

we then declare a new list that is emptyy that uses the steporheader classa template for the list

we then make a loop to 
for each object inside header loop to add new parameter isheader and declaring it truen
chaning header parameter hdid to id parameter
and turning step.steptext into parameter text.
the objec is then aded to the combinedlist.
this happens to all objects inside header.

similiar proce happens to steps objects.

this comment is just a statmetn of where we are inn the proces.
the combined list is now filled with the transformed  header and steps objects. that now are ust steporheader map objects

then a sorting process starts i dont understnads the sorting it then returns list that is sorted
and after that we call set state to say 
hey we have rebuilt this cominedlist
and result variable is now = the sorted combinedList .
*/