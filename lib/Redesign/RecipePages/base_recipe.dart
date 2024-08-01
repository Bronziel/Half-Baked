import 'package:fb2/addaptive/desktop_body.dart';
import 'package:fb2/addaptive/ipad_body.dart';
import 'package:fb2/addaptive/mobil_body.dart';
import 'package:flutter/material.dart';
import '../components/styles/spacing/sizedboxes.dart';
import '../styles_test/appbar.dart';
import 'normal_intro/introduction_box.dart';
import '../components/currents/imgholders/normal/image_boxes.dart';
import '../components/styles/ingboxshared.dart';
import '../components/currents/stepholder/prog_ui.dart';
class RecipeBodySize extends StatelessWidget {
  const RecipeBodySize({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeOfDevice = MediaQuery.sizeOf(context).width;
    bool mobilBody = sizeOfDevice < 600;
    bool ipadBody = sizeOfDevice > 600 == sizeOfDevice < 1400;
    bool desktopBody = sizeOfDevice > 1400;
    if(mobilBody){
      return const MobilBody(childWidget: NewDesignPage());
    } else if (ipadBody){return const IpadBody(childWidget: NewDesignPage());}else {return const DesktopBody(childWidget: NewDesignPage());}
  }
}
class NewDesignPage extends StatelessWidget {
  const NewDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidget(),
              Height20StandardWidget(),
              SecondRowWidget(),
            ],
          ),
        ),
      
    );
  }
}

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        Intro(),
        Width20StandardWidget(),
        MainImagePlusBoxes(),
      ],
    );
  }
}

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Widht40wallWidget(),
        RecipeListCard(other: true),
        Width20StandardWidget(),
        Builtbyme(),
      ],
    );
  }
}
