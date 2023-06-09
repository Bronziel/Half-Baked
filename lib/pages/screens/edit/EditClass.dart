import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';
import 'EditRecipe.dart';

class EditIngredientsBox extends StatefulWidget {
  const EditIngredientsBox({
    Key? key,
    required this.newRecipe,
    required this.formKey,
  }) : super(key: key);

  final NewRecipe newRecipe;
  final GlobalKey<FormState> formKey;

  @override
  _EditIngredientsBoxState createState() => _EditIngredientsBoxState();
}

class _EditIngredientsBoxState extends State<EditIngredientsBox> {
  List<Map<String, dynamic>> _ingredients = [];
  List<Widget> _ingredientWidgets = [];

  void _addIngredient() {
    Map<String, dynamic> newIngredient = {'name': '', 'amount': '', 'unit': ''};
    _ingredients.add(newIngredient);

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
                  newIngredient['name'] = value!;
                  widget.newRecipe.ingredients = _ingredients;
                },
              ),
            ),
            SizedBox(width: 8.0),
            Flexible(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration:
                    InputDecoration(hintText: 'Enter ingredient amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ingredient amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    newIngredient['amount'] = int.parse(value);
                  }
                },
              ),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter ingredient unit'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ingredient unit';
                  }
                  return null;
                },
                onSaved: (value) {
                  newIngredient['unit'] = value!;
                  widget.newRecipe.ingredients = _ingredients;
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addIngredient,
              child: const Text('Add another ingredient'),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _ingredients.remove(newIngredient);
                  _ingredientWidgets.removeLast();
                });
              },
              icon: Icon(Icons.delete),
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
        SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(children: _ingredientWidgets),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Save the ingredients to the recipe before disposing
    widget.newRecipe.ingredients = _ingredients;
    super.dispose();
  }
}

class EditEquipmentBox extends StatelessWidget {
  const EditEquipmentBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: 'Enter equipment (one per line)'),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter at least one equipment';
        }
        return null;
      },
      onSaved: (value) {
        newRecipe.equipment = value!.split('\n');
      },
    );
  }
}

class EditStepsBox extends StatelessWidget {
  const EditStepsBox({
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

class EditPortionsizeBox extends StatelessWidget {
  const EditPortionsizeBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: newRecipe.portionSize.toString(), // pre-filled portion size
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(hintText: 'Enter portion size'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a portion size';
        }
        return null;
      },
      onSaved: (value) => newRecipe.portionSize = int.parse(value ?? '0'),
    );
  }
}

class EditDescriptionBox extends StatelessWidget {
  const EditDescriptionBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: newRecipe.description, // pre-filled description
      decoration: const InputDecoration(hintText: 'Enter description'),
      maxLines: null, // Allow multiple lines
      keyboardType: TextInputType.multiline, // Enable multiline input
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a description';
        }
        return null;
      },
      onSaved: (value) => newRecipe.description = value!,
    );
  }
}

class EditTitelBox extends StatelessWidget {
  const EditTitelBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: newRecipe.title, // here we set the initial value
      decoration: const InputDecoration(hintText: 'Enter recipe title'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
      onSaved: (value) => newRecipe.title = value!,
    );
  }
}

class CookTimeBox extends StatelessWidget {
  const CookTimeBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            initialValue: newRecipe.prepTime.toString(), // pre-filled prep time
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(hintText: 'Prep Time (min)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a prep time';
              }
              return null;
            },
            onSaved: (value) {
              if (value != null && value.isNotEmpty) {
                newRecipe.prepTime = int.parse(value);
              }
            },
          ),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: TextFormField(
            initialValue:
                newRecipe.totalTime.toString(), // pre-filled total time
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(hintText: 'Total Time (min)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a total time';
              }
              return null;
            },
            onSaved: (value) {
              if (value != null && value.isNotEmpty) {
                newRecipe.totalTime = int.parse(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
