import 'package:flutter/material.dart';
import '../../components/styles/sharedtitleui.dart';
import '../Dialog/buttons_dialog/buttons.dart';
import '../Dialog/intro_dialogs.dart';

//const Basictitle(title: 'Kebabrulle',),
//const Addtitle(),
class Showtitel extends StatelessWidget {
  final Function(String) editItem;
  final Function(String) addItem;
  final String title;
  const Showtitel({
    required this.editItem,
    required this.addItem,
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
              onPressedEdit: () =>
                  TitelDialog.editTitel(context, editItem, addItem, title),
            ))
      ],
    );
  }
}

//new

class Addstitel extends StatelessWidget {
  final Function(String) addTitel;
  const Addstitel({
    required this.addTitel,
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
                  onPressed: () => TitelDialog.addTitel(
                    context,
                    addTitel,
                  ),
                ),
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
      onPressed: onPressedEdit,
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
  void updateTitle(String newTitle) {
    print('titel updated?');
    setState(() {
      myTitel = newTitle;
    });
  }

  void editTitle(String editTitle) {
    print('titel updated?');
    setState(() {
      myTitel = editTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      height: 75,
      decoration: jajsjs2(),
      child: myTitel == null
          ? Addstitel(
              addTitel: updateTitle,
            )
          : Showtitel(
              title: myTitel!,
              addItem: updateTitle,
              editItem: editTitle,
            ),
    );
  }
}
//always return adds titel when titles has string change to
/*
if (myTitel == null) {
      return Container(
        width: 410,
        height: 75,
        decoration: jajsjs2(),
        child:const const Showtitel(
      title: 'Kebabrulle',
    )
      );
    } else {
      return Container(
        width: 410,
        height: 75,
        decoration: jajsjs2(),
        child:const Addstitel()
      );
    }


*/

