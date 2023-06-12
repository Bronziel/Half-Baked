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
            const SizedBox(width: 8.0),
            Flexible(
              child: TextFormField(
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
              icon: const Icon(Icons.delete),
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
    return Container(
      width: 100.0, // Adjust the width as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButtonFormField<int>(
        value: newRecipe.portionSize,
        onChanged: (value) {
          if (value != null) {
            newRecipe.portionSize = value;
          }
        },
        decoration: InputDecoration(
          hintText: 'Portion Size', // Changed from 'Size' to 'Portion Size'
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
        items: List.generate(16, (index) {
          return DropdownMenuItem<int>(
            value: index + 1,
            child: Text(
              (index + 1).toString(),
              style:
                  TextStyle(fontSize: 16.0), // Adjust the font size as needed
            ),
          );
        }),
      ),
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

class CookTimeBox extends StatefulWidget {
  const CookTimeBox({
    Key? key,
    required this.newRecipe,
  }) : super(key: key);

  final NewRecipe newRecipe;

  @override
  _CookTimeBoxState createState() => _CookTimeBoxState();
}

class _CookTimeBoxState extends State<CookTimeBox> {
  final TextEditingController _prepTimeController = TextEditingController();
  final TextEditingController _totalTimeController = TextEditingController();
  double _prepTime = 0.0;
  double _totalTime = 0.0;
  final double _maxSliderValue = 600.0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _prepTimeController.text = _prepTime.round().toString();
    _totalTimeController.text = _totalTime.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Card(
        color: Color(0xFF9896F1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: buildColumnWithIconAndSlider(
                  'Prep Time (min)',
                  _prepTimeController,
                  _prepTime,
                  (value) {
                    setState(() {
                      _prepTime = value;
                      widget.newRecipe.prepTime = _prepTime.round();
                    });
                  },
                  180.0, // maxSliderValue for 'Prep Time'
                ),
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: buildColumnWithIconAndSlider(
                  'Total Time (min)',
                  _totalTimeController,
                  _totalTime,
                  (value) {
                    setState(() {
                      _totalTime = value;
                      widget.newRecipe.totalTime = _totalTime.round();
                    });
                  },
                  _maxSliderValue, // maxSliderValue for 'Total Time'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumnWithIconAndSlider(
      String title,
      TextEditingController controller,
      double time,
      Function(double) setTime,
      double maxSliderValue) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white, // makes the text color white
            fontWeight: FontWeight.bold, // makes the text bold
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Icon(Icons.access_time, color: Color.fromARGB(255, 97, 89, 100)),
            const SizedBox(width: 8.0),
            Container(
              width: 60,
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  double newValue = (value == null || value.isEmpty)
                      ? 0
                      : double.parse(value);
                  newValue =
                      newValue > maxSliderValue ? maxSliderValue : newValue;
                  setTime(newValue);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  if (double.parse(value) > maxSliderValue) {
                    return 'Please do not exceed maximum number $maxSliderValue';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Slider(
                min: 0,
                max: maxSliderValue,
                value: time <= maxSliderValue ? time : maxSliderValue,
                activeColor: Color.fromARGB(255, 97, 89, 100),
                inactiveColor: Color.fromARGB(255, 97, 89, 100),
                onChanged: (double value) {
                  setState(() {
                    setTime(value);
                    controller.value = TextEditingValue(
                      text: time.round().toString(),
                      selection: TextSelection.collapsed(
                          offset: controller.text.length),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
