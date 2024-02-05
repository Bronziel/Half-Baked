import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Head {
  final int hdid;
  final String headertext;

  Head({
    required this.hdid,
    required this.headertext,
  });

  factory Head.fromJson(Map<String, dynamic> json) {
    return Head(
      hdid: json['hdid'],
      headertext: json['headertext'],
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

  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(
      stepid: json['step'],
      hdid: json['hdid'],
      steptext: json['steptext'],
    );
  }
}

class Dataset {
  static Future<List<Steps>> finshedsteps() async {
    final String datastrn = jsonEncode({
      "Steps": [
        {"step": 1, "hdid": 1, "steptext": "ibland laggar jag för lite mat"},
        {
          "step": 3,
          "hdid": 1,
          "steptext": "vrf finns inte det så mkt matibland"
        },
        {"step": 2, "hdid": 2, "steptext": "vrf finns inte det så mkt mat"},
      ],
      "Header": [
        {"hdid": 1, "headertext": "ibland laggar jag för lite mat"},
        {"hdid": 2, "headertext": "vrf finns inte det så mkt mat"},
      ]
    });
    final rawdata = jsonDecode(datastrn);

    final List<dynamic> mysteps = rawdata['Steps'];
    List<Steps> result = mysteps.map((item) => Steps.fromJson(item)).toList();
    // result.sort((a, b) => a.stepid.compareTo(b.stepid));
    //decode
    //put into list
    // sort list
    grouped(result);
    return result;
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
