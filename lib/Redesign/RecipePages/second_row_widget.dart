import 'package:flutter/material.dart';

import 'ComponentsRedesign.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        SizedBox(
          width: 410,
          height: 463,
          child: Card(),
        ),
        Width20StandardWidget(),
        SizedBox(
          width: 1175,
          height: 474,
          child: Card(),
        )
      ],
    );
  }
}
