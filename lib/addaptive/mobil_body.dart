import 'package:fb2/Redesign/styles_test/appbar.dart';
import 'package:flutter/material.dart';
//anything smaller then 600
class MobilBody extends StatelessWidget {
  final Widget childWidget;
  const MobilBody({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40.0), child: NewAppbar()),
      body: SafeArea(child: childWidget,),
    );
  }
}