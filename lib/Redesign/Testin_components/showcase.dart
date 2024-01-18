import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'doneshowcase.dart';
import '../CreateRecipes/popup_boxes.dart';
import '../CreateRecipes/create_second_row.dart';
import '../CreateRecipes/CreateFirstRow/create_introduction_box.dart';
import '../RecipePages/Recipe/FirstRow/introduction_box.dart';
import '../RecipePages/Recipe/second_row_widget.dart';

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
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TimeTIlesshowcase(),
              RowOfIcons80(),
              Row(
                children: [
                  Column(
                    children: [
                      PopTimePort(
                        title: 'PrepTime:',
                        labelText: 'Add Preperation time',
                        hintText: 'preparation time in minutes',
                      ),
                      PopTimePort(
                        title: 'TotalTime:',
                        labelText: 'Add Total cooking time',
                        hintText: 'Total cooking time in minutes',
                      ),
                      PopTimePort(
                        title: 'Portionsize:',
                        labelText: 'Add Portion size',
                        isPortionSize:
                            true, // Used to set the keyboard type to text
                      ),
                      SmallTextfieldPop(
                        title: 'Steps Title:',
                        labelText: 'Add a steps title',
                        hintText: 'Ex Sidesallad, Prepping meat',
                      ),
                      SmallTextfieldPop(
                        title: 'Title:',
                        labelText: 'Add a title',
                        hintText: 'Ex Kebabrulle',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IngPop(
                        labelText: 'Add a Ingridient',
                        labelText2: 'Add an amount',
                        //labelText3: 'Add a unit',
                        hintText: 'ex milk, ground beef',
                        hintText2: 'ex 500, 200,10',
                        //hintText3: 'ex ml, g , l',
                        title: 'Ingridient',
                      ),
                      PopDescription(
                        title: 'Description',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Popsteps(
                        title: 'Step 1:',
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CreateRecipeListCard(),
                    ],
                  ),
                  Column(
                    children: [
                      RecipeListCard(),
                    ],
                  ),
                  Column(
                    children: [
                      CreateIntroductionWidget(),
                    ],
                  ),
                  Column(
                    children: [
                      IntroductionWidget(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Containerkals extends StatelessWidget {
  const Containerkals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 585,
      height: 255,
      decoration: const BoxDecoration(
        color: Color(0xFFF13030),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(children: [
        const SizedBox(
          height: 45,
        ),
        Row(
          children: [
            const SizedBox(
              width: 45,
            ),
            Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xff234234),
                width: 1,
              )),
              child: Image.asset(
                'images/kals/fire.png',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ]),
    );
  }
}

class CaloriecardStackedWidget extends StatelessWidget {
  const CaloriecardStackedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 255,
      width: 585,
      child: Card(
        color: Color(0xFFF13030),
      ),
    );
  }
}

class CalorieCardWidget extends StatelessWidget {
  const CalorieCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 585,
      height: 255,
      child: Card(
        color: const Color(0xFFF13030),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 45,
                    ),
                    Image.asset('images/kals/fire.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Calories',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      width: 211,
                    ),
                    Image.asset('images/kals/cheked.png'),
                  ],
                ),
              ),
              const Row(),
              const Row(),
            ],
          ),
        ),
      ),
    );
  }
}
