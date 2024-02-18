import 'package:fb2/Redesign/components/Popups/popup_boxes.dart';
import 'package:flutter/material.dart';
import '../buttons.dart' show Addbuttoncontainer;
import '../../Popups/popupclass.dart';

class Addinngtile extends StatelessWidget {
  const Addinngtile({super.key});

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
              child: Addbuttoncontainer(
                onPressed: () => DialogUtils.testShowIngPopDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
