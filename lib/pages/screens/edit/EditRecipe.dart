import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import '../../recipes/getrecipe.dart';
import '../../recipes/recipeLayout.dart';
import 'EditClass.dart';
import 'EditImage.dart';
import '../../../visualview/appbar/customappbar.dart';

class NewRecipe {
  String title = '';
  String description = '';
  int portionSize = 1;
  int prepTime = 0;
  int totalTime = 0;
  List<String> steps = [];
  List<String> equipment = [];
  List<Map<String, dynamic>> ingredients = [];
  List<XFile>? images;
}

class EditRecipeForm extends StatefulWidget {
  final VoidCallback onRecipeSaved;
  final Recipe? recipe;

  const EditRecipeForm({Key? key, required this.onRecipeSaved, this.recipe})
      : super(key: key);

  @override
  _EditRecipeFormState createState() => _EditRecipeFormState();
}

class _EditRecipeFormState extends State<EditRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final _ingredientsFormKey = GlobalKey<FormState>();
  final NewRecipe _newRecipe = NewRecipe();
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      _newRecipe.title = widget.recipe!.title;
      _newRecipe.description = widget.recipe!.description;
      _newRecipe.portionSize = widget.recipe!.portionSize;
      _newRecipe.prepTime = widget.recipe!.prepTime;
      _newRecipe.totalTime = widget.recipe!.totalTime;
      _newRecipe.steps = List<String>.from(widget.recipe!.steps);
      _newRecipe.equipment = List<String>.from(widget.recipe!.equipment);
      _newRecipe.ingredients =
          List<Map<String, dynamic>>.from(widget.recipe!.ingredients);
    }
  }

  void _deleteImage() {
    setState(() {
      _newRecipe.images = null;
    });
  }

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
        contentType: 'image/jpeg',
      );

      firebase_storage.Reference ref = storage.ref('/images/$fileName');
      firebase_storage.UploadTask uploadTask = ref.putData(data, metadata);
      await uploadTask;

      String imageUrl = await ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }
    return imageUrls;
  }

  Future<void> _uploadRecipeToFirestore(
      NewRecipe recipe, List<String> imageUrls) async {
    CollectionReference recipes =
        FirebaseFirestore.instance.collection('recipes');
    if (widget.recipe == null) {
      // creating new recipe
      await recipes.add({
        'title': recipe.title,
        'description': recipe.description,
        'portionSize': recipe.portionSize,
        'steps': recipe.steps,
        'ingredients': recipe.ingredients,
        'imageUrls': imageUrls,
        'prepTime': recipe.prepTime,
        'totalTime': recipe.totalTime,
        'equipment': recipe.equipment,
      });
    } else {
      // updating existing recipe
      await recipes.doc(widget.recipe!.id).update({
        'title': recipe.title,
        'description': recipe.description,
        'portionSize': recipe.portionSize,
        'steps': recipe.steps,
        'ingredients': recipe.ingredients,
        'imageUrls': imageUrls,
        'prepTime': recipe.prepTime,
        'totalTime': recipe.totalTime,
        'equipment': recipe.equipment,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Edit Recipe', color: Color.fromARGB(255, 97, 89, 100)),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Flexible(child: EditTitelBox(newRecipe: _newRecipe)),
                    const SizedBox(width: 16.0),
                    Flexible(child: EditPortionsizeBox(newRecipe: _newRecipe)),
                  ],
                ),
                const SizedBox(height: 16.0),
                CookTimeBox(newRecipe: _newRecipe),
                const SizedBox(height: 16.0),
                EditDescriptionBox(newRecipe: _newRecipe),
                const SizedBox(height: 16.0),
                EditEquipmentBox(newRecipe: _newRecipe),
                const SizedBox(height: 16.0),
                EditStepsBox(newRecipe: _newRecipe),
                const SizedBox(height: 16.0),
                EditIngredientsBox(
                  newRecipe: _newRecipe,
                  formKey: _ingredientsFormKey,
                ),
                ImagePickerWidget(
                  onImagesPicked: (images) {
                    setState(() {
                      _newRecipe.images = images;
                    });
                  },
                  initialImages: _newRecipe.images,
                ),
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
                      Navigator.pop(context);
                      widget.onRecipeSaved();
                    }
                  },
                  child: const Text('Submit Recipe'),
                ),
                ElevatedButton(
                  onPressed: _deleteImage,
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
