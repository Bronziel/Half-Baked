import 'package:flutter/material.dart';

class Boxwithtext extends StatelessWidget {
  const Boxwithtext({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 600,
      height: 475,
      child: Card(
        color: Colors.lightBlue,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  child: Text(
                    'Hey this is text',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                    //child: Checkbox(value: value, onChanged: onChanged),
                    ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Thecheckbox(),
            ),
          ],
        ),
      ),
    );
  }
}

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

class Boxwithsteps extends StatefulWidget {
  final String steptext;
  final int step;
  const Boxwithsteps({
    required this.step,
    required this.steptext,
    super.key,
  });

  @override
  State<Boxwithsteps> createState() => _BoxwithstepsState();
}

class _BoxwithstepsState extends State<Boxwithsteps> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: SizedBox(
          child: Text(
            'Step ${widget.step}:',
            style: const TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        title: SizedBox(
          child: Text(
            widget.steptext,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              color: const Color(0xFF000000),
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        trailing: SizedBox(
          child: Checkbox(
            value: isChecked,
            activeColor: Colors.green,
            onChanged: (newBool) {
              setState(() {
                if (newBool != null) {
                  // Check for null
                  isChecked = newBool;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
