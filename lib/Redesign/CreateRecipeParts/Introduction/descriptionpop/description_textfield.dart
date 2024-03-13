import 'package:flutter/material.dart';
import '../../../components/styles/style.dart';

class DescriptionTextField extends StatelessWidget {
  final String labelText;
  //controller part
  final String? errorText1;
  final TextEditingController titleController;
  const DescriptionTextField({
    required this.labelText,
    required this.titleController,
    this.errorText1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      top: 45,
      right: 100, // Adjusted to ensure the TextField is more square-like
      child: TextField(
        controller: titleController,
        decoration: InputDecoration(
          errorText: errorText1,
          labelText: labelText,
          labelStyle: StyleUtils.labelstylepop(),
          border: const OutlineInputBorder(),
          enabledBorder: StyleUtils.enabledborderstyle(),
        ),
        style: StyleUtils.textfieldstylepop(),
        maxLines: null, // Allows for unlimited lines
        minLines: 5, // Set this to a desired initial size
      ),
    );
  }
}
