import 'package:flutter/material.dart';

class Thecheckbox extends StatefulWidget {
  const Thecheckbox({super.key});

  @override
  State<Thecheckbox> createState() => _ThecheckboxState();
}

class _ThecheckboxState extends State<Thecheckbox> {
  bool isChecked = false;
  String myText = 'this is the text';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Checkbox(
              value: isChecked,
              activeColor: Colors.green,
              onChanged: (newBool) {
                setState(() {
                  isChecked = newBool!;
                });
              },
            ),
          ),
          SizedBox(
            child: isChecked
                ? Text(
                    myText,
                    style: const TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                : Text(
                    myText,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
