import 'package:flutter/material.dart';

import '../Redesign/styles_test/appbar.dart';
//anything bigger then 1400 width
class DesktopBody extends StatelessWidget {
   final Widget childWidget;
  const DesktopBody({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40.0), child: NewAppbar()),
      body: childWidget,
    );
  }
}