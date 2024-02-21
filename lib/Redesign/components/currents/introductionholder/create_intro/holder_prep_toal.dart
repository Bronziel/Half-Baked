import 'package:flutter/material.dart';
import '../../cards/sharedcard.dart';

class PortionPrepTotalHolder extends StatelessWidget {
  const PortionPrepTotalHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CreateIcontilesBox(),
      ],
    );
  }
}

class CreateIcontilesBox extends StatelessWidget {
  const CreateIcontilesBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Addcardcolumn(),
        Addiconcard(),
      ],
    ));
  }
}
