import 'package:flutter/material.dart';
import 'smallimages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../styles/spacing/sizedboxes.dart';
import 'redoneImage.dart';

class MainImagePlusBoxes extends StatelessWidget {
  const MainImagePlusBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          Carousell(),
          Width20StandardWidget(),
          PreviewBoxholder(),
        ],
      ),
    );
  }
}
/*BigImageBoxes1(
            imagePath: 'images/new/webb.jpg',
          ),*/

/*MaingImgHolder(
            imagePath: 'images/new/webb.jpg',
          ), */

//working on my new carousel
//need to make it act like it fecthes data.

class ImagePathstring {
  final String imagePath;
  ImagePathstring({
    required this.imagePath,
  });
}

class Carousell extends StatefulWidget {
  const Carousell({super.key});

  @override
  State<Carousell> createState() => _CarousellState();
}

class _CarousellState extends State<Carousell> {
  List<ImagePathstring> imagePathlist = [
    ImagePathstring(imagePath: 'images/new/kebabrulle.jpg'),
    ImagePathstring(imagePath: 'images/new/kebab1.jpeg'),
    ImagePathstring(imagePath: 'images/new/kebab3.jpg'),
    ImagePathstring(imagePath: 'images/new/kebabrulle.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 500,
      child: CarouselSlider.builder(
        itemCount: imagePathlist.length,
        itemBuilder: (
          context,
          index,
          realIndex,
        ) {
          //definerar listan av imagepath så det kan användas
          final imagePath = imagePathlist[index].imagePath;
          //returanrar min widget som håller blikden etc
          return BigImageBoxes1(imagePath: imagePath);
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          aspectRatio: 2.0,
          initialPage: 0,
        ),
      ),
    );
  }
}
