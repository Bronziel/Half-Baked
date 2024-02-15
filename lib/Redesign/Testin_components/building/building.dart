import 'package:flutter/material.dart';
import 'classforpopup.dart';
import 'testlist.dart';
import 'simpleone/okeyy.dart';

///import 'learn_json togheter.txt';

class Building extends StatelessWidget {
  const Building({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            minie3(),
            Column(
              children: [
                SizedBox(
                  width: 800,
                  height: 1000,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 800,
                        height: 50,
                        child: Addinngtiletest(),
                      ),
                      SizedBox(
                        width: 800,
                        height: 600,
                        child: ListOfIngtest(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Addbuttoncontainertest extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color; // Add a color property

  const Addbuttoncontainertest({
    required this.onPressed,
    super.key,
    this.color = const Color(0xFFCECCCC), // Set default color
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add, size: 24),
      color: color, // Use the color property
      onPressed: onPressed,
    );
  }
}

class Addinngtiletest extends StatelessWidget {
  const Addinngtiletest({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.white, // Set your desired color here
    );

    return Container(
      height: 50,
      width: 500,
      color: const Color(0xff161414),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 240, 13, 229),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 5,
              left: 10,
              child: Text('Add an Ingridient', style: textStyle),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: Addbuttoncontainertest(
                onPressed: () => DialogUtilstest.showIngPopDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
