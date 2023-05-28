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
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Description: ${recipe.description}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Portion Size: ${recipe.portionSize}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final ingredient in recipe.ingredients)
                Text(
                    '${ingredient['name']} - ${ingredient['amount']}${ingredient['unit']}'),
              const SizedBox(height: 16),
              const Text(
                'Steps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final step in recipe.steps) Text(step),
              const SizedBox(height: 16),
              const Text(
                'Images:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final imageUrl in recipe.imageUrls)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.network(imageUrl),
                ),
              const SizedBox(height: 16),
              const Text(
                'CookingTime:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Preparation Time: ${recipe.prepTime} minutes',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Total Time: ${recipe.totalTime} minutes',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Equipment:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (final equipmentItem in recipe.equipment) Text(equipmentItem),
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
