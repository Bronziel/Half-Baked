import 'package:flutter/material.dart';

class GlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty Page'),
      ),
      body: Center(
        child: Text(
          'This is an empty page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
