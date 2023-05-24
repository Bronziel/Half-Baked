import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;

class NewRecipe {
  String title = '';
  String description = '';
  int portionSize = 1;
  List<String> steps = [];
  List<Map<String, String>> ingredients = [];
  File? image;
}

class RecipeForm extends StatefulWidget {
  const RecipeForm({Key? key}) : super(key: key);

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final NewRecipe _newRecipe = NewRecipe();

  // For selecting an image from the user's device
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _newRecipe.image = File(image!.path);
    });
  }

  Future<String> _uploadImageToFirebase(File imageFile) async {
    String fileName = Path.basename(imageFile.path);
    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('/images/$fileName');
    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask;
    return await ref.getDownloadURL();
  }

  Future<void> _uploadRecipeToFirestore(
      NewRecipe recipe, String imageUrl) async {
    await FirebaseFirestore.instance.collection('recipes').add({
      'title': recipe.title,
      'description': recipe.description,
      'portionSize': recipe.portionSize,
      'steps': recipe.steps,
      'ingredients': recipe.ingredients,
      'imageUrls': [imageUrl],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter recipe title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) => _newRecipe.title = value!,
          ),
          // Continue with other fields in similar way: description, portionSize, steps, etc.
          // ...

          // Image picker button
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Select Image'),
          ),
          // Submit button
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                // Upload image to Firebase Cloud Storage
                final imageUrl =
                    await _uploadImageToFirebase(_newRecipe.image!);

                // Upload recipe to Firestore
                await _uploadRecipeToFirestore(_newRecipe, imageUrl);

                // Show a success message or navigate away
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Successfully submitted recipe')));
              }
            },
            child: Text('Submit Recipe'),
          ),
        ],
      ),
    );
  }
}
