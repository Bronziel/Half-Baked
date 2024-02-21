import 'package:flutter/material.dart';
import 'lists.dart';
import 'maintile.dart';
import '../../Popups/popstatefull.dart';

class RecipeListCard extends StatelessWidget {
  final bool other;
  const RecipeListCard({
    required this.other,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Cardsize(
      showdisplayport: other,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Holder(
              showlist:
                  other), //if true listnormal if false its the create recipe list
        ),
      ),
    );
  }
}

class Holder extends StatelessWidget {
  final bool showlist;
  const Holder({
    super.key,
    required this.showlist,
  });

  @override
  Widget build(BuildContext context) {
    return showlist ? const Listnormal() : const CreateListWithIngridients();
  }

  Widget normalbox() {
    return const Listnormal();
  }

  Widget createbox() {
    return const CreateListWithIngridients();
  }
}

class Creates extends StatelessWidget {
  const Creates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IngMainTile(
            showMaintile:
                false), //controls wich main tile size.we get since false we get the bigger one
        //Addinngtile(addItemCallback: addItem), //tile to add new ingridninets
        Expanded(
          child: ListOfIng(), //specila list for ingridinets
        ),
      ],
    );
  }
}

//card sized adjuster
class Cardsize extends StatelessWidget {
  final bool showdisplayport;
  final Widget child;
  const Cardsize({
    required this.child,
    required this.showdisplayport,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return showdisplayport ? normalbox(child) : createbox(child);
  }

  normalbox(child) {
    return Heights.normalbox(child);
  }

  createbox(child) {
    return Heights.createbox(child);
  }
}

class Heights {
  static SizedBox createbox(Widget child) {
    return SizedBox(
      width: 500,
      height: 450,
      child: child,
    );
  }

  static SizedBox normalbox(Widget child) {
    return SizedBox(
      width: 410,
      height: 460,
      child: child,
    );
  }
}
