import 'package:flutter/material.dart';
import '../../components/currents/sharedtitleui.dart';
import '../../components/currents/buttons.dart';
import '../../components/Popups/popupclass.dart';

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
            child: Titlewierd(
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
            child: Row(
              children: [
                const Titlewierd(
                  title: 'Add title',
                ),
                const SizedBox(
                  width: 10,
                ),
                Addbuttoncontainer(
                    onPressed: () => DialogUtils.showTitelDialog(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
