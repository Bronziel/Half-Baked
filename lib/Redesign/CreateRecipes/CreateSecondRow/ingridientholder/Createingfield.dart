import 'package:flutter/material.dart';
import 'ing_add_tile.dart';
import 'ing_list.dart';
import '../../../components/currents/ingholder/maintile.dart';

class CreateRecipeListCard extends StatelessWidget {
  const CreateRecipeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Cardsize(
      showdisplayport: false,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Creates(),
        ),
      ),
    );
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
        IngMainTile(showMaintile: false),
        Addinngtile(),
        Expanded(
          child: ListOfIng(),
        ),
      ],
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
