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
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Text(
              'my step',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(),
          SizedBox(),
        ],
      ),
    );
  }
}
