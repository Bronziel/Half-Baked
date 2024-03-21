import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../normal/smallimages.dart';
import 'package:cross_file/cross_file.dart';
import 'dart:typed_data';

//working on my new carousel
//need to make it act like it fecthes data.

class CreateImagePathstring {
  final String imagePath;
  CreateImagePathstring({
    required this.imagePath,
  });
}

class CreateCarousell extends StatefulWidget {
  final List<XFile> images;
  const CreateCarousell({
    required this.images,
    super.key,
  });

  @override
  State<CreateCarousell> createState() => _CarousellState();
}

class _CarousellState extends State<CreateCarousell> {
  //adding controllers etc
  final CarouselController primaryCarousellController = CarouselController();
  int currentPrimaryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 500,
      child: Row(
        children: [
          CarouselSlider.builder(
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return FutureBuilder<Uint8List>(
                future: widget.images[index].readAsBytes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return BigImageBoxes2(imageData: snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('Error loading image');
                  }
                  return CircularProgressIndicator(); // Or some other placeholder
                },
              );
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
            images: widget.images,
            primaryCarousellController: primaryCarousellController,
            current: currentPrimaryIndex,
          )
        ],
      ),
    );
  }
}

class Sidecolumn extends StatelessWidget {
  final List<XFile> images; // Updated to use XFile directly
  final CarouselController primaryCarousellController;
  final int current;

  const Sidecolumn({
    super.key,
    required this.images,
    required this.primaryCarousellController,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        bool isCurrent = current == entry.key;
        return GestureDetector(
          onTap: () => primaryCarousellController.animateToPage(entry.key),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<Uint8List>(
              future: entry.value.readAsBytes(),
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  return Container(
                    decoration: isCurrent
                        ? BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.0),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : null,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    // Assuming PreviewBox takes imageData directly for the thumbnail.
                    child: Image.memory(
                      snapshot.data!,
                      width:
                          100, // Example width, adjust based on your UI needs
                      height: 100, // Example height, adjust as necessary
                      fit: BoxFit.cover,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading image');
                }
                return CircularProgressIndicator(); // Placeholder while loading
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Decoration {
  static BoxDecoration purpledecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.purple, width: 2.0),
      borderRadius: BorderRadius.circular(
          12), // Slightly larger than the card's border radius
    );
  }
}

class BigImageBoxes2 extends StatelessWidget {
  final Uint8List imageData;

  const BigImageBoxes2({required this.imageData, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 1000,
      ),
      child: HeadlinerImage2(imageData: imageData),
    ));
  }
}

class HeadlinerImage2 extends StatelessWidget {
  final Uint8List imageData;
  const HeadlinerImage2({
    required this.imageData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // Assuming this is a function returning a ShapeBorder
            child: Image.memory(
              imageData,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

class CustomASpectratios2 {
  static double get aspectLaying => 3 / 2;
  static double get aspectBoxy => 4 / 3;
  static double get aspectPhone => 16 / 9;
  static double get aspectFullbox => 1 / 1;
}

//static methods to control size etc
class BoxTwos2 {
  static double get maxWidth => 1000;
  static double get maxHeight => 500;
}

class CardBoxTwos2 {
  static double get maxWidth => 1000;
  static double get maxHeight => 500;
}
