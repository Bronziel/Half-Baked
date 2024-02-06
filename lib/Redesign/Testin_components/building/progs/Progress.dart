import 'dart:convert';
import 'package:fb2/Redesign/Testin_components/building/mine.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

//not used yet
class Head {
  final int hdid;
  final String headertext;

  Head({
    required this.hdid,
    required this.headertext,
  });

  factory Head.fromJson(Map<String, dynamic> json2) {
    return Head(
      hdid: json2['hdid'],
      headertext: json2['headertext'],
    );
  }
}

class Steps {
  final int hdid;
  final int stepid;
  final String steptext;

  Steps({
    required this.hdid,
    required this.stepid,
    required this.steptext,
  });

  factory Steps.fromJson(Map<String, dynamic> json3) {
    return Steps(
      stepid: json3['step'],
      hdid: json3['hdid'],
      steptext: json3['steptext'],
    );
  }
}

class Dataset {
  static final String _dataStrn = jsonEncode({
    "Steps": [
      {
        "step": 2,
        "hdid": 1,
        "steptext": "Börja med att skära up salladshuuvudet."
      },
      {
        "step": 3,
        "hdid": 1,
        "steptext": "Blanda ihop kryddorna samt ta fram knvien"
      },
      {
        "step": 5,
        "hdid": 2,
        "steptext":
            "Lägg kötbitten i en panna med medelvarm tempratur. lägg i frivigilg olja samt kryddor"
      },
      {
        "step": 6,
        "hdid": 2,
        "steptext":
            "När kebaben har en brun färg samt köttet nått tempraturen 60 grader så kan du ta av köttet."
      },
      {"step": 7, "hdid": 2, "steptext": "Skär upp kötet  i strimmlor."},
      {
        "step": 9,
        "hdid": 3,
        "steptext": "blanda ihop olja  med salads  huuvudet."
      },
      {"step": 10, "hdid": 3, "steptext": "kasta i tomaterna samt paprikan"},
      {
        "step": 12,
        "hdid": 4,
        "steptext": "blanda  ihop majonäsen  med salt peppar"
      },
      {"step": 13, "hdid": 4, "steptext": "kasta i resten av kryddorna"},
      {"step": 15, "hdid": 5, "steptext": "grilla brödet lätt i en stekpanna"},
      {"step": 16, "hdid": 5, "steptext": "smörj in brödet med lite smör"},
      {
        "step": 18,
        "hdid": 6,
        "steptext": "lägg ett  lager av  sås  sedan lager  av sallad."
      },
      {"step": 19, "hdid": 6, "steptext": "lägg ett  lager av  kött och sås"},
      {
        "step": 20,
        "hdid": 6,
        "steptext":
            "blanda ihop sista kötet med sallad och sås  och  lägg ett  sista lager"
      },
    ],
    "Header": [
      {"step": 1, "hdid": 1, "headertext": "Prepp"},
      {"step": 4, "hdid": 2, "headertext": "Kött tillagning"},
      {"step": 8, "hdid": 3, "headertext": "salladen"},
      {"step": 11, "hdid": 4, "headertext": "såsen"},
      {"step": 14, "hdid": 5, "headertext": "Bröd"},
      {"step": 17, "hdid": 6, "headertext": "sätttihopp"},
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
    print(groupedByHdid);
  }
}

/*void idk() {
  //detta borde ske när datan förs up inte innana.
  var groupedByHdid = groupBy(thisdata, (item) => item.hdid);
  print(groupedByHdid);
}*/
