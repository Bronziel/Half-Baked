import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';
import 'recipe_form.dart';

class IngredientsBox extends StatefulWidget {
  const IngredientsBox({
    Key? key,
    required this.newRecipe,
    required this.formKey,
  }) : super(key: key);

  final NewRecipe newRecipe;
  final GlobalKey<FormState> formKey;

  @override
  _IngredientsBoxState createState() => _IngredientsBoxState();
}

class _IngredientsBoxState extends State<IngredientsBox> {
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
            SizedBox(width: 8.0),
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
              child: Text('Add another ingredient'),
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

class EquipmentBox extends StatelessWidget {
  const EquipmentBox({
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
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
