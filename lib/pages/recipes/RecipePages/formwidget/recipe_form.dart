import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'CookTimeBox.dart';

class NewRecipe {
  String title = '';
  String description = '';
  int portionSize = 1;
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

  const RecipeForm({Key? key, required this.onRecipeSaved}) : super(key: key);

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
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
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  final ValueChanged<List<XFile>?> onImagesPicked;
  final List<XFile>? initialImages;

  const ImagePickerWidget({
    Key? key,
    required this.onImagesPicked,
    this.initialImages,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<XFile>? _images;

  @override
  void initState() {
    super.initState();
    _images = widget.initialImages;
  }

  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    setState(() {
      _images = images;
    });

    widget.onImagesPicked(_images);
  }

  void _deleteImages() {
    setState(() {
      _images = null;
    });

    widget.onImagesPicked(_images);
  }

  void _discardSingleImage(int index) {
    setState(() {
      _images!.removeAt(index);
    });
    widget.onImagesPicked(_images);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Select Image'),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: _deleteImages,
              child: const Icon(Icons.delete),
            ),
          ],
        ),
        Container(
          height: 150, // adjust as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _images?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                width: 120, // adjust as needed
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
                                    kIsWeb
                                        ? Image.network(_images![index].path)
                                        : Image.file(
                                            File(_images![index].path),
                                          ),
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
                          child: kIsWeb
                              ? Image.network(_images![index].path,
                                  width: 100.0)
                              : Image.file(File(_images![index].path),
                                  width: 100.0),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _discardSingleImage(index),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
