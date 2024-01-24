import 'package:flutter/material.dart';
import '../../../components/currents/buttons.dart';
import '../../../components/currents/cards/fixedportionsize.dart';
import '../../../components/currents/cards/fixedtimecard.dart';

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
        addcardcolumn(),
        addiconcard(),
      ],
    ));
  }
}

class addcardcolumn extends StatelessWidget {
  const addcardcolumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PortionsizeCardWidget(
          showdisplayport: false,
          portion: '15',
        ),
        SizedBox(
          height: 5,
        ),
        TimeCard(
          showdisplaytime: false,
          titleadd: "Prep Time:",
          title: "",
          time: "",
        ),
        SizedBox(
          height: 5,
        ),
        TimeCard(
          showdisplaytime: false,
          titleadd: "Total Time:",
          title: "",
          time: "",
        ),
      ],
    );
  }
}

class addiconcard extends StatelessWidget {
  const addiconcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Addicon(),
        Addicon(),
      ],
    );
  }
}

class Addicon extends StatelessWidget {
  const Addicon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      width: 80,
      child: Card(
        color: Color(0xffD9D9D9),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Addbuttoncontainer(
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}
