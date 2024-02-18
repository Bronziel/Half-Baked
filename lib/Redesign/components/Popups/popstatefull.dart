import 'package:flutter/material.dart';
import 'statefull.dart';
import '../styles/style_objects.dart';
import '../styles/style.dart';
import 'popup_components.dart';

class IngridientPopupp extends StatefulWidget {
  final String title;

  final String labelText;
  final String labelText2;

  final String hintText;
  final String hintText2;

  final bool isPortionSize;
  const IngridientPopupp({
    required this.labelText,
    required this.labelText2,
    this.hintText = '',
    this.hintText2 = '',
    required this.title,
    this.isPortionSize = false,
    super.key,
  });

  @override
  State<IngridientPopupp> createState() => _IngridientPopuppState();
}

class _IngridientPopuppState extends State<IngridientPopupp> {
  @override
  Widget build(BuildContext context) {
    return Utils.ingpop(
      Card(
        color: Colors.amber,
        child: Stack(
          children: [
            Titles(title: widget.title),
            TitleTextField(
              labelText: widget.labelText,
              hintText: widget.hintText,
              bottom: 160,
            ),
            NumberTextField(
              isPortionSize: false,
              labelText: widget.labelText2,
              hintText: widget.hintText2,
              bottom: 85,
            ),
            //85
            const DropDownMenueTextField(),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}
