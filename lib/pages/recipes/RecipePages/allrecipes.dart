import 'package:flutter/material.dart';
import '../../../visualview/appbar/customappbar.dart';
import '../../../visualview/recipestuff/RecipeLook/recipe_layout.dart';
import 'RecipeViewPage.dart';
import '../getrecipe.dart' show fetchRecipes, deleteRecipe, fetchRecipesSearch;
import 'recipemenubutton.dart';
import 'floatingformbutton.dart';

class RecipelistPage extends StatefulWidget {
  const RecipelistPage({Key? key}) : super(key: key);

  @override
  _RecipelistPageState createState() => _RecipelistPageState();
}

class _RecipelistPageState extends State<RecipelistPage> {
  late Future<List<Recipe>> _futureRecipes;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureRecipes = fetchRecipes();
  }

  void _searchRecipes() {
    setState(() {
      _futureRecipes = fetchRecipesSearch(searchTerm: _searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: "Search recipes...",
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _searchRecipes,
            ),
          ),
        ),
      ),
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
