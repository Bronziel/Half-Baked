import 'package:flutter/material.dart';
import 'lists.dart';

class RecipeListCard extends StatelessWidget {
  const RecipeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Cardsize(
      showdisplayport: true,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Listnormal(),
        ),
      ),
    );
  }
}

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
