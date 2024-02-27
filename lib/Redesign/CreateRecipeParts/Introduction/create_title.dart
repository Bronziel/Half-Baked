import 'package:flutter/material.dart';
import '../../components/styles/sharedtitleui.dart';
import '../../components/currents/buttons.dart';
import '../Dialog/intro_dialogs.dart';

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
    return const Showtitel(
      title: 'Kebabrulle',
    );
  }

  Widget addstitel() {
    return const Addstitel();
  }
}

//const Basictitle(title: 'Kebabrulle',),
//const Addtitle(),
class Showtitel extends StatelessWidget {
  final String title;
  const Showtitel({
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
        Positioned(
            top: 20,
            right: 10,
            child: Editcontainer(
              onPressedEdit: () {},
            ))
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
                    onPressed: () => TitelDialog.addTitel(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Editcontainer extends StatelessWidget {
  final VoidCallback? onPressedEdit;
  const Editcontainer({
    required this.onPressedEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      icon: const Icon(Icons.edit, size: 24),
      color: const Color.fromARGB(255, 233, 228, 228),
      // Plus icon
      onPressed: onPressedEdit ?? () {},
    );
  }
}

class TitelHandler extends StatefulWidget {
  const TitelHandler({super.key});

  @override
  State<TitelHandler> createState() => _TitelHandlerState();
}

class _TitelHandlerState extends State<TitelHandler> {
  String? myTitel;
  @override
  Widget build(BuildContext context) {
    if (myTitel == null) {
      return Container();
    } else {
      return Container();
    }
  }
}

//always return adds titel when titles has string change to 