import 'package:flutter/material.dart';
import 'smallimages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'reedone_image.dart';

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
        ],
      ),
    );
  }
}
//working on my new carousel
//need to make it act like it fecthes data.

class ImagePathstring {
  final String imagePath;
  ImagePathstring({
    required this.imagePath,
  });
}

class Carousell extends StatefulWidget {
  final double widthTotal;
  final double heightTotal;
  final bool smallCarousellImagesBottomLeft;
  final bool sideColumn;

  const Carousell({super.key,
  this.heightTotal= 500,
  this.widthTotal = 1200, 
  this.smallCarousellImagesBottomLeft = true,
  this.sideColumn = true,});

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

  //adding controllers etc
  final CarouselController primaryCarousellController = CarouselController();
  int currentPrimaryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.widthTotal,
      height: widget.heightTotal,
      
      child:widget.smallCarousellImagesBottomLeft ?
       Row(
        children: [
          //i shoudl not use .builder its bad ides since it erbuild tehsm not good
          CarouselSlider.builder(
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
          const SizedBox(
            width: 40,
          ),
          Sidecolumn(
            imagePathlist: imagePathlist,
            primaryCarousellController: primaryCarousellController,
            current: currentPrimaryIndex,
          )
        ],
      ):Column(
        children: [
          //i shoudl not use .builder its bad ides since it erbuild tehsm not good
          CarouselSlider.builder(
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
          const SizedBox(
            width: 40,
          ),
          Sidecolumn(
            imagePathlist: imagePathlist,
            primaryCarousellController: primaryCarousellController,
            current: currentPrimaryIndex,
            sideColumn: widget.sideColumn,
          )
        ],
      ),
    );
  }
}

class Sidecolumn extends StatelessWidget {
  const Sidecolumn(
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
     if(sideColumn){
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagePathlist.asMap().entries.map((entry) {
        bool isCurrent = current == entry.key;
        return GestureDetector(
          onTap: () => primaryCarousellController.animateToPage(entry.key),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: isCurrent ? Decoration.purpledecoration() : null,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Previewbox(
                imagePath: entry.value.imagePath,
              ),
            ),
          ),
        );
      }).toList(),
    );
     }else{
       return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagePathlist.asMap().entries.map((entry) {
        bool isCurrent = current == entry.key;
        return GestureDetector(
          onTap: () => primaryCarousellController.animateToPage(entry.key),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: isCurrent ? Decoration.purpledecoration() : null,
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
}

//if list.lenght == >5 widget 2 active over widget 1?
class Decoration {
  static BoxDecoration purpledecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.purple, width: 2.0),
      borderRadius: BorderRadius.circular(
          12), // Slightly larger than the card's border radius
    );
  }
}
