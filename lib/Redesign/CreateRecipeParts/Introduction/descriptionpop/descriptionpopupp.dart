import 'package:flutter/material.dart';
import 'description_textfield.dart';
import '../../../components/styles/style_objects.dart';
import '../../../components/Popups/popup_components.dart';
//save button
import '../../Ingridients/Ingridientpops/textfield_ing.dart';

class DescriptionPopupp extends StatefulWidget {
  final String title;
  const DescriptionPopupp({
    required this.title,
    super.key,
  });

  @override
  State<DescriptionPopupp> createState() => _DescriptionPopuppState();
}

class _DescriptionPopuppState extends State<DescriptionPopupp> {
  String? errorText1;
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void saveDescription() {}

  @override
  Widget build(BuildContext context) {
    return Utils.bigpopbox(
      Card(
        color: const Color(0xFFD9D9D9),
        child: Stack(
          children: [
            Titles(title: widget.title),
            DescriptionTextField(
              titleController: titleController,
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
