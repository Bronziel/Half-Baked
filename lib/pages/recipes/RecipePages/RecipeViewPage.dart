import 'package:flutter/material.dart';
import '../recipeLayout.dart';
import 'dart:io';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Description: ${recipe.description}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Portion Size: ${recipe.portionSize}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final ingredient in recipe.ingredients)
                Text('${ingredient['name']} - ${ingredient['amount']}'),
              SizedBox(height: 16),
              Text(
                'Steps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final step in recipe.steps) Text(step),
              SizedBox(height: 16),
              Text(
                'Images:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final imageUrl in recipe.imageUrls)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _isNetworkUrl(imageUrl)
                      ? Image.network(imageUrl)
                      : Image.file(File(imageUrl)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isNetworkUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }
}
