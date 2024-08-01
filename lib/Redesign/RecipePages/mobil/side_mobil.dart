import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../components/currents/imgholders/normal/image_boxes.dart';
import '../../components/currents/imgholders/normal/smallimages.dart';


class SidecolumnMobile extends StatelessWidget {
  const SidecolumnMobile(
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
      return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagePathlist.asMap().entries.map((entry) {
        bool isCurrent = current == entry.key;
        return GestureDetector(
          onTap: () => primaryCarousellController.animateToPage(entry.key),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: isCurrent ? Decoration2.purpledecoration() : null,
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



class Decoration2 {
  static BoxDecoration purpledecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.purple, width: 2.0),
      borderRadius: BorderRadius.circular(
          12), // Slightly larger than the card's border radius
    );
  }
}