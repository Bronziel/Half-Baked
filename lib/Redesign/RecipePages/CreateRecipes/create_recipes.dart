import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/spacing/sizedboxes.dart';
import 'create_first_row.dart';
import 'create_second_row.dart';
import '../../styles_test/appbar.dart';

class CreateRecipesPage extends StatelessWidget {
  const CreateRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: NewAppbar(),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              CreateFirstRowWidget(),
              Height20StandardWidget(),
              CreateSecondRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class oldappbar extends StatelessWidget {
  const oldappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
