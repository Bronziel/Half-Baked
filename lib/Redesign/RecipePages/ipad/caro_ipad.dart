import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../components/currents/imgholders/normal/image_boxes.dart';
import '../../components/currents/imgholders/normal/reedone_image.dart';
import '../../components/currents/imgholders/normal/smallimages.dart';

class CarousellIpad extends StatefulWidget {
  final double widthTotal;
  final double heightTotal;
  final bool smallCarousellImagesBottomLeft;
  final bool sideColumn;

  const CarousellIpad({super.key,
  this.heightTotal= 500,
  this.widthTotal = 300, 
  this.smallCarousellImagesBottomLeft = true,
  this.sideColumn = true,});

  @override
  State<CarousellIpad> createState() => _CarousellIpadState();
}

class _CarousellIpadState extends State<CarousellIpad> {
  List<ImagePathstring> imagePathlist = [
    ImagePathstring(imagePath: 'images/new/kebabrulle.jpg'),
    ImagePathstring(imagePath: 'images/new/kebab1.jpeg'),
    ImagePathstring(imagePath: 'images/new/kebab3.jpg'),
    ImagePathstring(imagePath: 'images/new/kebabrulle.jpg'),
  ];

  //adding controllers etc
  final CarouselController primaryCarousellController = CarouselController();
  int currentPrimaryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       //i shoudl not use .builder its bad ides since it erbuild tehsm not good
       ConstrainedBox(
         constraints: const BoxConstraints(maxHeight: 600, maxWidth:600),
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
             return HeadlinerImage(imagePath: imagePath);
           },
           options: CarouselOptions(
             autoPlay: true,       
             initialPage: 0,
             //adding onpagechanged to edit index when pages change
             onPageChanged: (index, reason) {
               setState(() {
                 currentPrimaryIndex = index;
               });
             },
           ),
           //adding controller outisde caroseloptions  but inside builder
           carouselController: primaryCarousellController,
         ),
       ),
       const SizedBox(
         width: 40,
       ),
       Sidecolumn(
         imagePathlist: imagePathlist,
         primaryCarousellController: primaryCarousellController,
         current: currentPrimaryIndex,
       )
     ],);
  }
}

class SidecolumnIpad extends StatelessWidget {
  const SidecolumnIpad(
      {super.key,
      required this.imagePathlist,
      required this.primaryCarousellController,
      required this.current,
      this.sideColumn=true,});

  final List<ImagePathstring> imagePathlist;
  final CarouselController primaryCarousellController;
  final int current;
  final bool sideColumn;

  @override
  Widget build(BuildContext context) {
    
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagePathlist.asMap().entries.map((entry) {
        bool isCurrent = current == entry.key;
        return GestureDetector(
          onTap: () => primaryCarousellController.animateToPage(entry.key),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: isCurrent ? DecorationIpad.purpledecoration() : null,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Previewbox(
                imagePath: entry.value.imagePath,
              ),
            ),
          ),
        );
      }).toList(),
    );
   
     }
    
  
}


class DecorationIpad {
  static BoxDecoration purpledecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.purple, width: 2.0),
      borderRadius: BorderRadius.circular(
          12), // Slightly larger than the card's border radius
    );
  }
}



class HeadlinerImageIpad extends StatelessWidget {
  const HeadlinerImageIpad({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(  
      child: Card(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // Assuming this is a function returning a ShapeBorder
            child: Image.asset(
              imagePath,
            )),
      ),
    );
  }
}