import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../visualview/recipestuff/RecipeLook/recipeLayout.dart';

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

Future<void> deleteImage(String imageUrl) async {
  final Reference firebaseStorageRef =
      FirebaseStorage.instance.refFromURL(imageUrl);

  try {
    await firebaseStorageRef.delete();
  } catch (e) {
    // e.g, e might be that the file didn't exist, wasn't reachable, etc.
    print(e);
  }
}

Future<void> deleteRecipe(Recipe recipe) async {
  // Delete the images from Firebase Storage
  for (var url in recipe.imageUrls) {
    await deleteImage(url);
  }

  // Delete the recipe document from Firestore
  await FirebaseFirestore.instance
      .collection('recipes')
      .doc(recipe.id)
      .delete();
}
