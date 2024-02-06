import 'package:flutter/material.dart';
import 'Progress.dart';

class Builtbyme extends StatelessWidget {
  const Builtbyme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 650,
      height: 475,
      child: Card(
        color: Colors.green,
        child: Displaytestlist(),
      ),
    );
  }
}

class Displaytestlist extends StatefulWidget {
  const Displaytestlist({super.key});

  @override
  State<Displaytestlist> createState() => _DisplaytestlistState();
}

class _DisplaytestlistState extends State<Displaytestlist> {
  late List<Steps> result = [];
  late List<Head> resulthead = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //needs eror hanadling
    result = await Dataset.finshedsteps();
    resulthead = await Dataset.finshedheader();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          final stepItem = result[index];
          return Stepbox(
            step: stepItem.stepid,
            steptext: stepItem.steptext,
          );
        },
      ),
    );
  }
}

class Fixinglist {}

//check index of headers, check header yes no , put in list of steps of hdid 1 then hdid2
//void check amount of headers.
class Stepbox extends StatelessWidget {
  //steptext string
  //hdid int
  final String steptext;
  final int step;
  const Stepbox({
    required this.steptext,
    required this.step,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: Row(
        children: [
          SizedBox(
            child: Text('Step $step:'),
          ),
          const SizedBox(
            width: 40,
          ),
          SizedBox(
            child: Text(steptext),
          ),
          const SizedBox(
            width: 20,
          ),
          const SizedBox(
            child: Text('checkbox'),
          ),
        ],
      ),
    );
  }
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
    return SizedBox(
      height: 50,
      width: 400,
      child: Row(
        children: [
          SizedBox(
            child: Text(headerText),
          ),
        ],
      ),
    );
  }
}

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