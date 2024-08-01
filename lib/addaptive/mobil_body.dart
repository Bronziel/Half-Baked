import 'package:flutter/material.dart';
//anything smaller then 600
class MobilBody extends StatelessWidget {
  final Widget childWidget;
  const MobilBody({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobil'),),
      body: SafeArea(child: childWidget,),
    );
  }
}