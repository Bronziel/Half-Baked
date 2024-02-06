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
      {"step": 1, "hdid": 1, "steptext": "ibland laggar jag för lite mat"},
      {"step": 3, "hdid": 1, "steptext": "vrf finns inte det så mkt matibland"},
      {"step": 2, "hdid": 2, "steptext": "vrf finns inte det så mkt mat"},
    ],
    "Header": [
      {"hdid": 1, "headertext": "ibland laggar jag för lite mat"},
      {"hdid": 2, "headertext": "vrf finns inte det så mkt mat"},
      {"hdid": 4, "headertext": "vrf finns inte det så mkt mat2"},
      {"hdid": 3, "headertext": "vrf finns inte det så mkt mat3"},
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
