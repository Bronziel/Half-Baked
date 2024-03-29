import 'package:flutter/material.dart';
import 'description_textfield.dart';
import '../../../components/styles/style_objects.dart';
import '../../../components/Popups/popup_components.dart';
//save button
import '../../Ingridients/Ingridientpops/textfield_ing.dart';

class DescriptionPopupp extends StatefulWidget {
  //for edit
  final bool isEdit;
  final Function(String)? editDescription;
  final String? initialDescription;

  //normal
  final Function(String) addDescription;
  final String title;
  const DescriptionPopupp({
    this.initialDescription,
    this.editDescription,
    this.isEdit = false,
    required this.addDescription,
    required this.title,
    super.key,
  });

  @override
  State<DescriptionPopupp> createState() => _DescriptionPopuppState();
}

class _DescriptionPopuppState extends State<DescriptionPopupp> {
  String? errorText1;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void saveDescription() {
    setState(() {
      errorText1 =
          descriptionController.text.isEmpty ? 'Field cannot be empty' : null;
    });
    if (errorText1 == null && widget.isEdit == false) {
      widget.addDescription(descriptionController.text);
      descriptionController.clear();
      Navigator.of(context).pop();
    }

    if (errorText1 == null && widget.isEdit == true) {
      widget.editDescription!(descriptionController.text);
      descriptionController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Utils.bigpopbox(
      Card(
        color: const Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Titles(title: widget.title),
            DescriptionTextField(
              titleController: descriptionController,
              errorText1: errorText1,
              labelText: 'Add a Description',
            ),
            const PostionedStopButton(),
            SaveButtonIng(onPressed: () => saveDescription()),
          ],
        ),
      ),
    );
  }
}
