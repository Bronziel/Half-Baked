import 'package:flutter/material.dart';
import '../../../visualview/customappbar.dart';
import '../recipeLayout.dart';
import 'RecipeViewPage.dart';
import '../getrecipe.dart' show fetchRecipes, getInitialRecipes;
import 'formwidget/recipe_form.dart';

class RecipelistPage extends StatefulWidget {
  const RecipelistPage({Key? key}) : super(key: key);

  @override
  _RecipelistPageState createState() => _RecipelistPageState();
}

class _RecipelistPageState extends State<RecipelistPage> {
  late Future<List<Recipe>> _futureRecipes;
  List<Recipe> initialRecipes = [];

  @override
  void initState() {
    super.initState();
    initialRecipes = getInitialRecipes();
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
              itemCount: snapshot.data!.length + initialRecipes.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < initialRecipes.length) {
                  // display initial recipe
                  Recipe recipe = initialRecipes[index];
                  return ListTile(
                    title: Text(recipe.title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsPage(recipe: recipe),
                        ),
                      );
                    },
                  );
                } else {
                  // display fetched recipe
                  Recipe recipe = snapshot.data![index - initialRecipes.length];
                  return ListTile(
                    title: Text(recipe.title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsPage(recipe: recipe),
                        ),
                      );
                    },
                  );
                }
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
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RecipeForm()),
          );
        },
      ),
    );
  }
}
