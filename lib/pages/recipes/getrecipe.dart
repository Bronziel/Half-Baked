import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipeLayout.dart';

Future<List<Recipe>> fetchRecipes() async {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('recipes').get();

  return querySnapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data != null) {
      return Recipe.fromJson({
        'id': doc.id, // add this line
        ...data,
      });
    } else {
      throw StateError('Missing data for document ${doc.id}');
    }
  }).toList();
}

Future<void> deleteRecipe(String id) async {
  await FirebaseFirestore.instance.collection('recipes').doc(id).delete();
}

List<Recipe> getInitialRecipes() {
  List<Recipe> initialRecipes = [];

  return initialRecipes;
}
