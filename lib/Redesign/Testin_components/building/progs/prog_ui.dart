import 'package:flutter/material.dart';
import 'Progress.dart';

class Builtbyme extends StatelessWidget {
  const Builtbyme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 650,
      height: 475,
      child: Card(
        color: Colors.green,
        child: Displaytestlist(),
      ),
    );
  }
}

class Displaytestlist extends StatefulWidget {
  const Displaytestlist({super.key});

  @override
  State<Displaytestlist> createState() => _DisplaytestlistState();
}

class _DisplaytestlistState extends State<Displaytestlist> {
  late List<Steps> result = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    result = await Dataset.finshedsteps();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          final stepItem = result[index];
          return Stepbox(
            step: stepItem.stepid,
            steptext: stepItem.steptext,
          );
        },
      ),
    );
  }
}

class Stepbox extends StatelessWidget {
  //steptext string
  //hdid int
  final String steptext;
  final int step;
  const Stepbox({
    required this.steptext,
    required this.step,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: Row(
        children: [
          SizedBox(
            child: Text('Step $step:'),
          ),
          SizedBox(
            child: Text(steptext),
          ),
          const SizedBox(
            child: Text('checkbox'),
          ),
        ],
      ),
    );
  }
}

class HeaderBox extends StatelessWidget {
  //headertext string
  //hdid int
  const HeaderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      child: const Row(
        children: [
          SizedBox(
            child: Text('Header text'),
          ),
        ],
      ),
    );
  }
}
