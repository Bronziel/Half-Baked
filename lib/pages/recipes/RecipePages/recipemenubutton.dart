import 'package:flutter/material.dart';
import '../getrecipe.dart' show fetchRecipes, deleteRecipe;
import '../../../visualview/recipestuff/RecipeLook/recipe_layout.dart';
import '../../../visualview/recipestuff/edit/EditRecipe.dart';

class RecipeActionsPopup extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onRecipeAction;

  const RecipeActionsPopup(
      {required this.recipe, required this.onRecipeAction});

  Future<void> _deleteRecipe(BuildContext context) async {
    bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Recipe'),
          content: const Text('Are you sure you want to delete this recipe?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      await deleteRecipe(recipe);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('The recipe has been deleted')),
      );
      onRecipeAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditRecipeForm(
                recipe: recipe,
                onRecipeSaved: onRecipeAction,
              ),
            ),
          );
        } else if (value == 2) {
          _deleteRecipe(context);
        }
      },
    );
  }
}
