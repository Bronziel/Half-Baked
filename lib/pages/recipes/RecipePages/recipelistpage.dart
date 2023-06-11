import 'package:flutter/material.dart';
import '../../../visualview/appbar/customappbar.dart';
import '../recipeLayout.dart';
import 'RecipeViewPage.dart';
import '../getrecipe.dart' show fetchRecipes, deleteRecipe;
import 'formwidget/recipe_form.dart';

import '../../screens/edit/EditRecipe.dart';

class RecipelistPage extends StatefulWidget {
  const RecipelistPage({Key? key}) : super(key: key);

  @override
  _RecipelistPageState createState() => _RecipelistPageState();
}

class _RecipelistPageState extends State<RecipelistPage> {
  late Future<List<Recipe>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    _futureRecipes = fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Recipe List Page', color: Color.fromARGB(255, 97, 89, 100)),
      body: FutureBuilder<List<Recipe>>(
        future: _futureRecipes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                // display fetched recipe
                Recipe recipe = snapshot.data![index];
                return ListTile(
                  title: Text(recipe.title),
                  trailing: RecipeActionsPopup(
                    recipe: recipe,
                    onRecipeAction: () {
                      setState(() {
                        _futureRecipes = fetchRecipes();
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(recipe: recipe),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
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
                    child: RecipeForm(onRecipeSaved: () {
                      setState(() {
                        _futureRecipes = fetchRecipes();
                      });
                    }),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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
