import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Stepbox extends StatelessWidget {
  //steptext string
  //hdid int
  //step int
  const Stepbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      child: const Row(
        children: [
          SizedBox(
            child: Text('step etc'),
          ),
          SizedBox(
            child: Text('Step text'),
          ),
          SizedBox(
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
  const HeaderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      child: const Row(
        children: [
          SizedBox(
            child: Text('Header text'),
          ),
        ],
      ),
    );
  }
}

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

class Step {
  final int hdid;
  final int stepid;
  final String steptext;

  Step({
    required this.hdid,
    required this.stepid,
    required this.steptext,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      stepid: json['step'],
      hdid: json['hdid'],
      steptext: json['steptext'],
    );
  }
}

class Dataset {
  static Future<List<Step>> finshedsteps() async {
    final String datastrn = jsonEncode({
      "Steps": [
        {"step": 1, "hdid": 1, "steptext": "ibland laggar jag för lite mat"},
        {"step": 2, "hdid": 1, "steptext": "vrf finns inte det så mkt mat"},
      ],
      "Header": [
        {"hdid": 1, "headertext": "ibland laggar jag för lite mat"},
        {"hdid": 2, "headertext": "vrf finns inte det så mkt mat"},
      ]
    });
    final rawdata = jsonDecode(datastrn);

    final List<dynamic> mysteps = rawdata['Steps'];
    List<Step> result = mysteps.map((item) => Step.fromJson(item)).toList();
    //decode
    //put into list
    // sort list
    grouped(result);
    return result;
  }

  static void grouped(List<Step> steps) {
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
