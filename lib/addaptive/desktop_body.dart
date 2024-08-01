import 'package:flutter/material.dart';
//anything bigger then 1400 width
class DesktopBody extends StatelessWidget {
   final Widget childWidget;
  const DesktopBody({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: childWidget,
    );
  }
}