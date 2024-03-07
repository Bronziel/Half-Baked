import 'package:flutter/material.dart';

//small img box
double get smallimgheight => 70;
double get smallimgwidth => 70;

//big img box
double get widthbigimage => 1000;
double get heightimage => 500;
//select icon img diffrent sizes etc

//clip img
BorderRadius borderradius() => BorderRadius.circular(10);

//shape for card
RoundedRectangleBorder smallImageShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), // Define the border radius here
  );
}
