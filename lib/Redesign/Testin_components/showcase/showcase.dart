import 'package:fb2/Redesign/Testin_components/building/building.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'comb_showcase.dart';
import '../built/myreorder.dart';
import '../../components/currents/introductionholder/normal_intro/introduction_box.dart';
import '../../components/currents/imgholders/normal/image_boxes.dart';
import '../../components/currents/imgholders/image_create_hold/create_image_boxes.dart';
import '../../components/currents/ingholder/ingboxshared.dart';
import '../../components/currents/stepholder/prog_ui.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          flexibleSpace: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 400, // Adjust the position as needed
                  child: SvgPicture.asset(
                    'images/bestickvit.svg',
                    width: 62, // Set the width of the SVG
                    height: 54.63, // Set the height of the SVG
                  ),
                ),
                const Text(
                  'HalfBaked',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Color(0xFFFFFFff)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Row(
                children: [
                  RowOfIcons80(),
                  TimeTIlesshowcase(),
                ],
              ),
              const Popupsdisplayed(),
              const Row(
                children: [
                  Column(
                    children: [
                      CreateRecipeListCard2(),
                    ],
                  ),
                  Column(
                    children: [
                      RecipeListCard(other: true),
                    ],
                  ),
                  Column(
                    children: [
                      IntroductionWidget(showIntrodisplay: true),
                    ],
                  ),
                  Column(
                    children: [
                      IntroductionWidget(showIntrodisplay: false),
                    ],
                  ),
                ],
              ),
              const Column(
                children: [
                  MainImagePlusBoxes(),
                  CreateMainImagePlusBoxes(),
                ],
              ),
              Column(
                children: [
                  Builtbyme(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
