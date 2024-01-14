import 'package:flutter/material.dart';
import '../../../visualview/recipestuff/formwidget/recipe_form.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height *
                  0.75, // Adjust the multiplier as needed
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: RecipeForm(onRecipeSaved: onPressed),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
