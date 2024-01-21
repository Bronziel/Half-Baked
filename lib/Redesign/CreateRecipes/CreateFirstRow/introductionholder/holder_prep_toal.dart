import 'package:flutter/material.dart';
import '../../../components/components_redesign.dart';

class PortionPrepTotalHolder extends StatelessWidget {
  const PortionPrepTotalHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 55,
        ),
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
        decoration: jajas(),
        child: const Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Column(
              children: [
                CreatePortionsizeCardWidget(),
                SizedBox(
                  height: 5,
                ),
                CreateTimeCard(
                  title: "Prep Time:",
                ),
                SizedBox(
                  height: 5,
                ),
                CreateTimeCard(
                  title: "Total Time:",
                ),
              ],
            ),
          ],
        ));
  }

  BoxDecoration jajas() {
    return BoxDecoration(
        border: Border.all(
      color: const Color.fromARGB(255, 213, 6, 164),
      width: 2,
    ));
  }
}
