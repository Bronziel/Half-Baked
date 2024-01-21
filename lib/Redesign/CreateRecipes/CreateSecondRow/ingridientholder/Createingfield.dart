import 'package:flutter/material.dart';
import 'ing_title_tile.dart';
import 'ing_add_tile.dart';
import 'ing_list.dart';

class CreateRecipeListCard extends StatelessWidget {
  const CreateRecipeListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 450,
      child: Card(
        color: const Color(0xffd9d9d9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Column(
            children: [
              IngTitleTile(),
              Addinngtile(),
              Expanded(
                child: ListOfIng(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
