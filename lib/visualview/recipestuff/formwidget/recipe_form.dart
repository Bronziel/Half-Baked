import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';

import 'box_class.dart';
import 'image_class.dart';

class NewRecipe {
  String title = '';
  String description = '';
  int? portionSize = null;
  int prepTime = 0; // new field
  int totalTime = 0; // new field
  List<String> steps = [];
  List<String> equipment = []; // new field
  List<Map<String, dynamic>> ingredients =
      []; // updated to dynamic to include units
  List<XFile>? images; // updated to support multiple images
}

class RecipeForm extends StatefulWidget {
  final VoidCallback onRecipeSaved;

  // Use super parameter for 'key'
  const RecipeForm({super.key, required this.onRecipeSaved});

  @override
  RecipeFormState createState() => RecipeFormState();
}

class RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final _ingredientsFormKey = GlobalKey<FormState>();
  final NewRecipe _newRecipe = NewRecipe();
  // Dispose of the selected image
  void _deleteImage() {
    setState(() {
      _newRecipe.images = null;
    });
  }

// For selecting multiple images from the user's device
  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    setState(() {
      _newRecipe.images = images;
    });
  }

  Future<List<String>> _uploadImagesToFirebase(List<XFile> images) async {
    List<String> imageUrls = [];
    for (var imageFile in images) {
      String fileName = Path.basename(imageFile.path);
      Uint8List data = await imageFile.readAsBytes();

      final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg', // Set content type explicitly as image/jpeg
      );

      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref('/images/$fileName');

      firebase_storage.UploadTask uploadTask = ref.putData(data, metadata);
      await uploadTask;

      String imageUrl = await ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }
    return imageUrls;
  }

  Future<void> _uploadRecipeToFirestore(
      NewRecipe recipe, List<String> imageUrls) async {
    await FirebaseFirestore.instance.collection('recipes').add({
      'title': recipe.title,
      'description': recipe.description,
      'portionSize': recipe.portionSize,
      'steps': recipe.steps,
      'ingredients': recipe.ingredients,
      'imageUrls': imageUrls, // updated to pass a list of URLs
      'prepTime': recipe.prepTime,
      'totalTime': recipe.totalTime,
      'equipment': recipe.equipment,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Card(
                color: Color(0xFF9896F1),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Create a New Recipe',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(child: TitelBox(newRecipe: _newRecipe)),
                  const SizedBox(width: 16.0),
                  Flexible(child: PortionsizeBox(newRecipe: _newRecipe)),
                ],
              ),
              const SizedBox(height: 16.0),
              CookTimeBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              DescriptionBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              EquipmentBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              StepsBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              IngredientsBox(
                newRecipe: _newRecipe,
                formKey: _ingredientsFormKey,
              ),
              const SizedBox(height: 16.0),

              // Continue with other fields in similar way: description, portionSize, steps, etc.
              // ...

              // Image picker and delete image buttons
              ImagePickerWidget(
                onImagesPicked: (images) {
                  setState(() {
                    _newRecipe.images = images;
                  });
                },
                initialImages: _newRecipe.images,
              ),

              // Submit button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      _ingredientsFormKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _ingredientsFormKey.currentState!.save();
                    List<String> imageUrls = [];
                    if (_newRecipe.images != null &&
                        _newRecipe.images!.isNotEmpty) {
                      imageUrls =
                          await _uploadImagesToFirebase(_newRecipe.images!);
                    }
                    await _uploadRecipeToFirestore(_newRecipe, imageUrls);
                    Navigator.pop(context); // close the form
                    widget.onRecipeSaved(); // notify that recipe has been saved
                  }
                },
                child: const Text('Submit Recipe'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _newRecipe.images = [];
                  });
                },
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
