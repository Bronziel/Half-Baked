import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 650,
      height: 475,
      child: Card(
        color: Colors.green,
        child: ListView.builder(
          itemCount: _steps.length, //kollar hur många steg det är
          itemBuilder: (BuildContext context, int index) {
            //byte från int index till int id så den läggger den ordningne isället
            return Testarmer(
              id: _steps[index].id, // Pass individual id
              text: _steps[index].text, // Pass individual text
            );
          },
        ),
      ),
    );
  }
}

class Testarmer extends StatelessWidget {
  final int id;
  final String text;
  const Testarmer({
    required this.text,
    required this.id,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 1,
      )),
      child: Row(
        children: [
          //step
          //text
          //box with checkbox
          SizedBox(
            child: Text('Step $id'),
          ), //us index 'Step $index')
          SizedBox(
            child: Text(text),
          ),
          const SizedBox(
            width: 40,
            height: 40,
            child: Card(
              color: Color.fromARGB(255, 76, 87, 175),
            ),
          )
        ],
      ),
    );
  }
}

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
    id: 2,
    idclass: 2,
    idheader: 2,
  ),
  Steps(
    text: 'kebab',
    id: 1,
    idclass: 2,
    idheader: 2,
  ),
  Steps(
    text: 'sesam',
    id: 3,
    idclass: 2, // ge header denna istället så kan man ta bort header
    idheader: 2,
  ),

  // ... more items
]..sort((a, b) =>
    a.id.compareTo(b.id)); // This sorts the steps by id in ascending order.

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

class Mine2 extends StatelessWidget {
  const Mine2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 650,
      height: 475,
      child: Card(
        color: Colors.green,
      ),
    );
  }
}
