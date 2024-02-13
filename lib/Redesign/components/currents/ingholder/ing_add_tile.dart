import 'package:fb2/Redesign/components/Popups/popup_boxes.dart';
import 'package:flutter/material.dart';
import '../buttons.dart' show Addbuttoncontainer;

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
        child: const Stack(
          children: [
            Positioned(
              top: 5,
              left: 10,
              child: Text('Add an Ingridient', style: textStyle),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: Addbuttoning(),
            ),
          ],
        ),
      ),
    );
  }
}

class Addbuttoning extends StatelessWidget {
  final Color color; // Add a color property

  const Addbuttoning({
    super.key,
    this.color = const Color(0xFFCECCCC), // Set default color
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add, size: 24),
      color: color, // Use the color property

      onPressed: () => DialogUtils.showIngPopDialog(context),

      // Add your action for this button
    );
  }
}

//ing pop
/* IngPop(
            title: "Ingredient Details",
            labelText: "Ingredient",
            labelText2: "Quantity",
            hintText: "Enter ingredient name",
            hintText2: "Enter quantity",
          ),*/

class DialogUtils {
  //not retuurn value insted retunr action
  static void showIngPopDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: IngPop(
            title: "Ingredient Details",
            labelText: "Ingredient",
            labelText2: "Quantity",
            hintText: "Enter ingredient name",
            hintText2: "Enter quantity",
          ),
        );
      },
    );
  }
}
/* static void showIngPopDialog(BuildContext context, {required String title, required String labelText, required String labelText2, String hintText = '', String hintText2 = ''}) {
    showDialog(
      context: context, */