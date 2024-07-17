import 'dart:convert';
//import 'package:fb2/Redesign/Testin_components/building/learn_json%20togheter.txt';

import 'package:collection/collection.dart';

//not used yet
class Head {
  final int step;
  final int hdid;
  final String headertext;

  Head({
    required this.step,
    required this.hdid,
    required this.headertext,
  });

  factory Head.fromJson(Map<String, dynamic> json2) {
    return Head(
      step: json2['id'],
      hdid: json2['hdid'],
      headertext: json2['headertext'],
    );
  }
}

class Steps {
  final int hdid;
  final int stepid;
  final String steptext;
  final int realstep;

  Steps({
    required this.hdid,
    required this.stepid,
    required this.steptext,
    required this.realstep,
  });

  factory Steps.fromJson(Map<String, dynamic> json3) {
    return Steps(
      stepid: json3['id'],
      hdid: json3['hdid'],
      steptext: json3['steptext'],
      realstep: json3['stepp'],
    );
  }
}

class Dataset {
  static final String _dataStrn = jsonEncode({
    "Steps": [
      {
        "id": 2,
        "hdid": 1,
        "steptext": "Börja med att skära up salladshuuvudet.",
        "stepp": 1
      },
      {
        "id": 3,
        "hdid": 1,
        "steptext": "Blanda ihop kryddorna samt ta fram knvien",
        "stepp": 2
      },
      {
        "id": 5,
        "hdid": 2,
        "steptext":
            "Lägg kötbitten i en panna med medelvarm tempratur. lägg i frivigilg olja samt kryddor",
        "stepp": 3
      },
      {
        "id": 6,
        "hdid": 2,
        "steptext":
            "När kebaben har en brun färg samt köttet nått tempraturen 60 grader så kan du ta av köttet.",
        "stepp": 4
      },
      {
        "id": 7,
        "hdid": 2,
        "steptext": "Skär upp kötet  i strimmlor.",
        "stepp": 5
      },
      {
        "id": 9,
        "hdid": 3,
        "steptext": "blanda ihop olja  med salads  huuvudet.",
        "stepp": 6
      },
      {
        "id": 10,
        "hdid": 3,
        "steptext": "kasta i tomaterna samt paprikan",
        "stepp": 7
      },
      {
        "id": 12,
        "hdid": 4,
        "steptext": "blanda  ihop majonäsen  med salt peppar",
        "stepp": 8
      },
      {
        "id": 13,
        "hdid": 4,
        "steptext": "kasta i resten av kryddorna",
        "stepp": 9
      },
      {
        "id": 15,
        "hdid": 5,
        "steptext": "grilla brödet lätt i en stekpanna",
        "stepp": 10
      },
      {
        "id": 16,
        "hdid": 5,
        "steptext": "smörj in brödet med lite smör",
        "stepp": 11
      },
      {
        "id": 18,
        "hdid": 6,
        "steptext": "lägg ett  lager av  sås  sedan lager  av sallad.",
        "stepp": 12
      },
      {
        "id": 19,
        "hdid": 6,
        "steptext": "lägg ett  lager av  kött och sås",
        "stepp": 13
      },
      {
        "id": 20,
        "hdid": 6,
        "steptext":
            "blanda ihop sista kötet med sallad och sås  och  lägg ett  sista lager",
        "stepp": 14
      },
    ],
    "Header": [
      {"id": 1, "hdid": 1, "headertext": "Prepp"},
      {"id": 4, "hdid": 2, "headertext": "Kött tillagning"},
      {"id": 8, "hdid": 3, "headertext": "salladen"},
      {"id": 11, "hdid": 4, "headertext": "såsen"},
      {"id": 14, "hdid": 5, "headertext": "Bröd"},
      {"id": 17, "hdid": 6, "headertext": "sätttihopp"},
    ]
  });
  //underscore for only using the varibel inside this class.
  static final _rawData = jsonDecode(_dataStrn);

  static Future<List<Steps>> finshedsteps() async {
    final List<dynamic> mysteps = _rawData['Steps'];
    List<Steps> result = mysteps.map((item) => Steps.fromJson(item)).toList();
    result.sort((a, b) => a.stepid.compareTo(b.stepid));
    //grouped(result);
    return result;
  }

  static Future<List<Head>> finshedheader() async {
    final List<dynamic> myheader = _rawData['Header'];
    List<Head> resulthead =
        myheader.map((item) => Head.fromJson(item)).toList();
    resulthead.sort((a, b) => a.hdid.compareTo(b.hdid));

    return resulthead;
  }

  static void grouped(List<Steps> steps) {
    // Group by 'hdid'
    var groupedByHdid = groupBy(steps, (item) => item.hdid);
  }
}

/*void idk() {
  //detta borde ske när datan förs up inte innana.
  var groupedByHdid = groupBy(thisdata, (item) => item.hdid);
  print(groupedByHdid);
}*/
