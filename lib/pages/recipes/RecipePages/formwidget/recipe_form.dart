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
  List<Map<String, dynamic>> ingredients = [];
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TitelBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              DescriptionBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              PortionsizeBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              StepsBox(newRecipe: _newRecipe),
              const SizedBox(height: 16.0),
              IngredientsBox(newRecipe: _newRecipe),

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

                    // Only upload image if one is selected
                    String imageUrl = '';
                    if (_newRecipe.image != null) {
                      imageUrl =
                          await _uploadImageToFirebase(_newRecipe.image!);
                    }

                    // Upload recipe to Firestore
                    await _uploadRecipeToFirestore(_newRecipe, imageUrl);

                    // ...
                  }
                },
                child: Text('Submit Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepsBox extends StatelessWidget {
  const StepsBox({
    Key? key,
    required NewRecipe newRecipe,
  })  : _newRecipe = newRecipe,
        super(key: key);

  final NewRecipe _newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Enter steps (one per line)'),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter at least one step';
        }
        return null;
      },
      onSaved: (value) {
        _newRecipe.steps = value!.split('\n');
      },
    );
  }
}

class PortionsizeBox extends StatelessWidget {
  const PortionsizeBox({
    super.key,
    required NewRecipe newRecipe,
  }) : _newRecipe = newRecipe;

  final NewRecipe _newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Enter portion size'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a portion size';
        }
        return null;
      },
      onSaved: (value) => _newRecipe.portionSize = int.parse(value!),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    super.key,
    required NewRecipe newRecipe,
  }) : _newRecipe = newRecipe;

  final NewRecipe _newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Enter description'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a desciption';
        }
        return null;
      },
      onSaved: (value) => _newRecipe.description = value!,
    );
  }
}

class TitelBox extends StatelessWidget {
  const TitelBox({
    super.key,
    required NewRecipe newRecipe,
  }) : _newRecipe = newRecipe;

  final NewRecipe _newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Enter recipe title'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
      onSaved: (value) => _newRecipe.title = value!,
    );
  }
}

class IngredientsBox extends StatefulWidget {
  const IngredientsBox({
    Key? key,
    required NewRecipe newRecipe,
  })  : _newRecipe = newRecipe,
        super(key: key);

  final NewRecipe _newRecipe;

  @override
  _IngredientsBoxState createState() => _IngredientsBoxState();
}

class _IngredientsBoxState extends State<IngredientsBox> {
  List<Widget> _ingredientWidgets = [];

  void _addIngredient() {
    setState(() {
      _ingredientWidgets.add(
        Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter ingredient name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ingredient name';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Save ingredient name here...
                },
              ),
            ),
            SizedBox(width: 8.0),
            Flexible(
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: 'Enter ingredient amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ingredient amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Save ingredient amount here...
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    // Start with one ingredient
    _addIngredient();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._ingredientWidgets,
        ElevatedButton(
          onPressed: _addIngredient,
          child: Text('Add another ingredient'),
        ),
      ],
    );
  }
}
