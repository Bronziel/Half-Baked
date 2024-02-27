import 'package:flutter/material.dart';

//size of card etc
import 'package:fb2/Redesign/components/styles/style_objects.dart';
import 'package:fb2/Redesign/components/styles/style.dart';
//textfield
import 'package:fb2/Redesign/CreateRecipeParts/Ingridients/Ingridientpops/textfield_ing.dart';
//postined save buutton postioned stop button and title tile
import 'package:fb2/Redesign/components/Popups/popup_components.dart';

class IntroductionPopupp extends StatefulWidget {
  //text inside textfield
  final String labelText;
  final String hintText;
  final String title;
  //funuction to update etc
  final Function(String) addTitel;

  const IntroductionPopupp({
    //text
    required this.labelText,
    required this.hintText,
    required this.title,
    //function
    required this.addTitel,
    super.key,
  });

  @override
  State<IntroductionPopupp> createState() => _IntroductionPopuppState();
}

class _IntroductionPopuppState extends State<IntroductionPopupp> {
  //initalise controllers
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

  @override
  Widget build(BuildContext context) {
    return Utils.smallpopbox(
      Card(
        color: StyleUtils.cardcolorgrey(),
        child: Stack(
          children: [
            Titles(title: widget.title),
            TitleTextField(
              labelText: widget.labelText,
              hintText: widget.hintText,
              //controllers
              errorText1: errorText1,
              titleController: titleController,
            ),
            const PostionedStopButton(),
            const PostionedSaveButton(),
          ],
        ),
      ),
    );
  }
}
