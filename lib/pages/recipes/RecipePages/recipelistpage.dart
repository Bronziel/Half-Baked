import 'package:flutter/material.dart';
import '../recipeLayout.dart';
import 'RecipeViewPage.dart';
import '../getrecipe.dart' show fetchRecipes, getInitialRecipes;

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
      appBar: AppBar(title: const Text('Gym - Digital Cookbook')),
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
    );
  }
}
