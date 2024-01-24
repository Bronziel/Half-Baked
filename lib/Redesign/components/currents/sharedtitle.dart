import 'package:flutter/material.dart';
import 'buttons.dart';

class Titleholder extends StatelessWidget {
  final bool showtitle;
  const Titleholder({
    required this.showtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 75,
      decoration: jajsjs2(),
      child: showtitle ? title() : addstitel(),
    );
  }

  Widget title() {
    return const Basictitle(
      title: 'Kebabrulle',
    );
  }

  Widget addstitel() {
    return const Addstitel();
  }
}

//const Basictitle(title: 'Kebabrulle',),
//const Addtitle(),
class Basictitle extends StatelessWidget {
  final String title;
  const Basictitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 11, // Your specified distance from the top
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Title(
              title: title,
              //'KebabRulle'
            ),
          ),
        ),
      ],
    );
  }
}

//new

class Addstitel extends StatelessWidget {
  const Addstitel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 60,
        ),
        SizedBox(
          width: 280,
          child: Container(
            decoration: sdasdasd(),
            child: const Row(
              children: [
                Title(
                  title: 'Add title',
                ),
                SizedBox(
                  width: 10,
                ),
                Addbuttoncontainer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Pacifico',
        fontSize: 40,
        color: Color(0xFFFFFFFF), // Corrected color format
      ),
    );
  }
}

BoxDecoration sdasdasd() {
  return BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(255, 213, 6, 164),
      width: 2,
    ),
  );
}

BoxDecoration jajsjs2() {
  return BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(255, 70, 115, 231),
      width: 1,
    ),
  );
}
