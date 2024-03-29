import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'edit_recipe.dart';

class EditIngredientsBox extends StatefulWidget {
  final NewRecipe newRecipe;
  final GlobalKey<FormState> formKey;

  const EditIngredientsBox({
    super.key,
    required this.newRecipe,
    required this.formKey,
  });

  @override
  _EditIngredientsBoxState createState() => _EditIngredientsBoxState();
}

class _EditIngredientsBoxState extends State<EditIngredientsBox> {
  List<Map<String, dynamic>> _ingredients = [];
  List<Widget> _ingredientWidgets = [];

  @override
  void initState() {
    super.initState();

    // Pre-populate the _ingredients list with existing ingredients
    _ingredients = List.from(widget.newRecipe.ingredients);

    // Create a form field for each existing ingredient
    if (_ingredients.isNotEmpty) {
      _ingredients.forEach((ingredient) {
        _addIngredient(ingredient);
      });
    } else {
      // Start with one ingredient if there are no existing ingredients
      _addIngredient();
    }
  }

  void _addIngredient([Map<String, dynamic>? ingredient]) {
    final Map<String, dynamic> newIngredient =
        ingredient ?? {'name': '', 'amount': '', 'unit': ''};
    if (ingredient == null) {
      _ingredients.add(newIngredient);
    }

    setState(() {
      _ingredientWidgets.add(
        Row(
          children: [
            Flexible(
              child: TextFormField(
                initialValue:
                    newIngredient['name'], // pre-filled ingredient name
                decoration:
                    const InputDecoration(hintText: 'Enter ingredient name'),
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
            const SizedBox(width: 8.0),
            Flexible(
              child: TextFormField(
                initialValue: newIngredient['amount']
                    .toString(), // pre-filled ingredient amount
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration:
                    const InputDecoration(hintText: 'Enter ingredient amount'),
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
                initialValue:
                    newIngredient['unit'], // pre-filled ingredient unit
                decoration:
                    const InputDecoration(hintText: 'Enter ingredient unit'),
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
              onPressed: () => _addIngredient(),
              child: const Text('Add another ingredient'),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _ingredients.remove(newIngredient);
                  _ingredientWidgets.removeLast();
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      );
    });
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
  final NewRecipe newRecipe;

  const EditEquipmentBox({
    super.key,
    required this.newRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: newRecipe.equipment.join('\n'), // pre-filled equipment
      decoration:
          const InputDecoration(hintText: 'Enter equipment (one per line)'),
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
  final NewRecipe newRecipe;

  const EditStepsBox({
    super.key,
    required this.newRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: newRecipe.steps.join('\n'), // pre-filled steps
      decoration: const InputDecoration(hintText: 'Enter steps (one per line)'),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter at least one step';
        }
        return null;
      },
      onSaved: (value) {
        newRecipe.steps = value!.split('\n');
      },
    );
  }
}

class EditPortionsizeBox extends StatelessWidget {
  final NewRecipe newRecipe;

  const EditPortionsizeBox({
    super.key,
    required this.newRecipe,
  });

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
  final NewRecipe newRecipe;

  const EditDescriptionBox({
    super.key,
    required this.newRecipe,
  });

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
  final NewRecipe newRecipe;

  const EditTitelBox({
    super.key,
    required this.newRecipe,
  });

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
  final NewRecipe newRecipe;

  const CookTimeBox({
    super.key,
    required this.newRecipe,
  });

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
