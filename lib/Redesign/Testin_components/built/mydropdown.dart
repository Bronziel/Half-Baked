import 'package:flutter/material.dart';
import '../../components/styles/style.dart';
import '../../components/styles/style_objects.dart';

//should use enum to make it more consice
class Mymenue extends StatelessWidget {
  const Mymenue({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: 400,
        height: 400,
        child: Card(
          color: Color.fromARGB(255, 234, 26, 26),
          child: Column(
            children: [
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
