import 'package:flutter/material.dart';
import '../../../visualview/appbar/customappbar.dart';
import '../../../visualview/recipestuff/RecipeLook/recipe_layout.dart';
import 'recipe_view_page.dart';
import '../getrecipe.dart' show fetchRecipes, deleteRecipe;
import 'recipemenubutton.dart';
import 'floatingformbutton.dart';

class RecipelistPage extends StatefulWidget {
  const RecipelistPage({super.key});

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
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        setState(() {
          _futureRecipes = fetchRecipes();
        });
      }),
    );
  }
}
