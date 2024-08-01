import 'package:flutter/material.dart';
//anything smaller then 600
class MobilBody extends StatelessWidget {
  final Widget childWidget;
  const MobilBody({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: childWidget,),
    );
  }
}