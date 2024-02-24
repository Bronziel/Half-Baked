import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//new
import '../../styles_test/compos/buttone_template.dart';
import '../showcase/showcase.dart';
import 'Building _Central/building_redirected.dart';
import '../showcase/showcasestyle.dart';

class BuildComponentPage extends StatelessWidget {
  const BuildComponentPage({super.key});

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
          child: ButtonColumn(),
        ),
      ),
    );
  }
}

class ButtonColumn extends StatelessWidget {
  const ButtonColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ButtonTemplate(
          landingspace: ShowcasePage(),
          buttonText: "ShowCase",
          buttonColor: Color.fromARGB(255, 189, 12, 225),
        ),
        ButtonTemplate(
          landingspace: Styleshowcasepage(),
          buttonText: "StyleShowcase",
          buttonColor: Color.fromARGB(255, 214, 225, 12),
        ),
        ButtonTemplate(
          landingspace: BuildingRedirect(),
          buttonText: "Building Components",
          buttonColor: Color.fromARGB(255, 47, 237, 17),
        ),
      ],
    );
  }
}
