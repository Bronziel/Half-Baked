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
  List<String>? existingImages; // new variable to hold existing images
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
      _newRecipe.existingImages = List<String>.from(widget
          .recipe!.imageUrls); // fill existingImages with the existing urls
    }
  }

  void _deleteImage() {
    setState(() {
      _newRecipe.images = null;
    });
  }

  void _deleteExistingImage(String url) async {
    await deleteImage(
        url); // delete image from Firebase using the function from getrecipe.dart
    setState(() {
      _newRecipe.existingImages!
          .remove(url); // remove the url from existingImages list
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
                ExistingImagesWidget(
                  existingImages: _newRecipe.existingImages!,
                  onDelete: (url) => _deleteExistingImage(url),
                ),
                const SizedBox(height: 16.0),
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
// add existing images to imageUrls
                      if (_newRecipe.existingImages != null &&
                          _newRecipe.existingImages!.isNotEmpty) {
                        imageUrls.addAll(_newRecipe.existingImages!);
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

class ExistingImagesWidget extends StatelessWidget {
  final List<String> existingImages;
  final Function(String) onDelete;

  ExistingImagesWidget({required this.existingImages, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: existingImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: Stack(
                              children: <Widget>[
                                Image.network(existingImages[index]),
                                Positioned(
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.close,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      child: Image.network(existingImages[index], width: 100.0),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => onDelete(existingImages[index]),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
