import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipeLayout.dart';

Future<List<Recipe>> fetchRecipes() async {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('recipes').get();

  return querySnapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data != null) {
      return Recipe.fromJson(data);
    } else {
      throw StateError('Missing data for document ${doc.id}');
    }
  }).toList();
}

List<Recipe> getInitialRecipes() {
  List<Recipe> initialRecipes = [
    Recipe(
      title: 'Recipe 1',
      description: 'This is a description of Recipe 1',
      portionSize: 4,
      steps: [
        'Step 1: Do this',
        'Step 2: Do that',
      ],
      ingredients: [
        {'name': 'Rosemary', 'amount': '100g'},
        {'name': 'Thyme', 'amount': '50g'},
      ],
      imageUrls: [
        'Images/watermelon.jpg',
        'https://e0.pxfuel.com/wallpapers/748/615/desktop-wallpaper-awesome-pineapple-high-resolution-new-pineapple-tumblr.jpg',
      ],
    ),
    Recipe(
      title: 'Recipe 2',
      description: 'This is a description of Recipe 2',
      portionSize: 2,
      steps: [
        'Step 1: Do this',
        'Step 2: Do that',
        'Step 3: Do something else',
      ],
      ingredients: [
        {'name': 'Basil', 'amount': '50g'},
        {'name': 'Garlic', 'amount': '3 cloves'},
        {'name': 'Tomatoes', 'amount': '2'},
      ],
      imageUrls: [
        //'https://www.example.com/images/recipe2.jpg',
      ],
    ),
  ];

  return initialRecipes;
}
