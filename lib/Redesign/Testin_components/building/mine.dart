import 'package:flutter/material.dart';
import 'idk.dart';
import 'dart:convert';

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
        child: Column(
          children: [
            Text(restaurant.name),
            Text(stepeed.id.toString()),
            const Row(
              children: [
                Text(''), //text inforamtion
                SizedBox(
                  width: 150,
                ),
                Text(''), //just number
                SizedBox(
                  width: 30,
                ),
                Text('') //string and int this belongs to "number"
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// type: String
final jsonData = '{ "name": "Pizza da Mario", "cuisine": "Italian" }';
final parsedJson = jsonDecode(jsonData);

class Restaurant {
  final String name;
  final String cuisine;

  Restaurant({required this.name, required this.cuisine});
  factory Restaurant.fromJson(Map<String, dynamic> data) {
    final name = data['name'];
    final cuisine = data['cuisine'];
    return Restaurant(name: name, cuisine: cuisine);
  }
}

final restaurant = Restaurant.fromJson(parsedJson);
//single string of text test with map
final jsonPassed =
    jsonEncode({"id": 1, "idheader": 1, "text": "börja med att mixa äggen"});
final jsontest = jsonDecode(jsonPassed);

class Omg {
  final int id;
  final int idheader;
  final String text;
  Omg({required this.id, required this.idheader, required this.text});
  factory Omg.fromjson(Map<String, dynamic> Passed) {
    final myid = Passed['id'];
    final myheader = Passed['idheader'];
    final mytext = Passed['text'];
    return Omg(
      id: myid,
      idheader: myheader,
      text: mytext,
    );
  }
}

final stepeed = Omg.fromjson(jsontest);
//when sending string to firebase will header be a int yes bc a int is needed for the
//header and id bc list reseeded with int id.

final multijson = jsonEncode({
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
      "step2": 1,
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
//step 1 decode map step 2 create the list of the decoded obejcts, step 3 pass decoded list to
final Map<String, dynamic> multijsondata = jsonDecode(multijson);
final List<dynamic> jsonmulti = multijsondata['foodsteps'];

class Multiples {
  final String textar;
  final int id2;
  final int steps;
  Multiples({
    required this.id2,
    required this.steps,
    required this.textar,
  });
  factory Multiples.fromjson(Map<String, dynamic> multiples) {
    //vrf anurlunda med fler? vrf ingen dekleration. ah för jag deklarar konstat för steps etc
    return Multiples(
      id2: multiples['id'],
      steps: multiples['step2'],
      textar: multiples['text2'],
    );
  }
}
// Assuming jsonmulti is already defined and populated as per your example

List<Multiples> result = jsonmulti
    .map((item) => Multiples.fromjson(item))
    .toList()
  ..sort((a, b) => a.id2.compareTo(b.id2));


//reorder hear?
//happends after class handles the json string
/*Detta är vad som händer med json.
1:första steget är att vi säger hej vi har data i annat format snälla översätt till dart objecst.
-vi vet bara nu att hej här massa data object men ingen betydelse.

2:vi säger nu hej datan du har fått följer ett mönster som är en map object
-detta map object är inuti foodsteps varje map har en string dynamic key vlaute system. 
-vi vet nu att det finns 2 mappar med denna utlägning men datan i sig är inte fäst till något-

3: vi har en klass som säger hej we har 3 parametar som är 3 olika json data punkter.
id är id json nu har vi en mall som datorn kan följa o säga hej kolla på mallen för att se vad json datan är.

4: vi säger nu hej det här är en lista med mallen multiples som kallas med variable result.
-vi säger använd mapparn from jsonmulti datan. omvandala/transfrom mapparna med mallen så att det är json
-to list är för att säga alla maparna läggs sedan i en lista efter omvandlats.
- item delen är lambda för att temporärt difrenter objecten så var objects omvanlda.
hej det kommer flera object så¨temporärt heter varje object någit med item.
nament påverkas inte av andra variablker med samma namn 

ps. vrf används map<string, dynamic>
jo för typesafty decode leverar alltid en string dynamice men det är bara för typesafe
some när man gör <widget>

ps.2 just nu ger den ut en map vilket var mening för det är ju lista av maps.
måste lägga till en fuction för att söka på en keyvalue om det är det man vill.

ps 3. hur kallas min data just nu ligger den utanför och den kallas inte så hur laddas den in?
jo den ligger nu istället i global scope vilket gör att den intiliserar med appen startar
den kollar alla filer och kollar alla data etc och intliserar dom istället för ha dom i en funktion.
 */