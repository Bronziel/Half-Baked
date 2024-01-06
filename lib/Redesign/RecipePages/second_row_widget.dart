import 'package:flutter/material.dart';

import 'ComponentsRedesign.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Standard40wallWidget(),
        SizedBox(
          width: 410,
          height: 463,
          child: Card(),
        ),
        SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 1175,
          height: 474,
          child: Card(),
        )
      ],
    );
  }
}
