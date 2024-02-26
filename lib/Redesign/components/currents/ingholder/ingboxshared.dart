import 'package:flutter/material.dart';
import 'lists.dart';
import '../../../CreateRecipeParts/Ingridients/parent_Ing.dart';

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
