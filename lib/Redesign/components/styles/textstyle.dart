//popuptextfields use 20 inter.
//popuptitle use monserrat semibodl 20
//hint text textfield inter 20,

//new design description 24 fontweight bold
//new design title Pacifico 40
//new design portion time font size 24 fontweight w.700
//new design steps number Pacifico 40 blue
//new desing steps text Paprika 24 black
//new desing ingridnet box fontsize 24 fontweight w.700
//new desing ingirindet box title 24 FontWeight.w700,

//showcase text

import 'package:flutter/material.dart';

class StyleTextRecipe {
  static TextStyle titelrecipe() {
    return const TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 40,
    );
  }

  static TextStyle descriptionrecipe() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  static TextStyle porttotalrecipe() {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );
  }

  static TextStyle ingboxtitel() {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );
  }

  static TextStyle ingbox() {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );
  }

  static TextStyle stepsnumber() {
    return const TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 40,
    );
  }

  static TextStyle stepstext() {
    return const TextStyle(
      fontFamily: 'Paprika',
      fontSize: 24,
    );
  }
}

//popupboxes
class TextPopStyle {
  static TextStyle poptitle() {
    return const TextStyle(
      fontFamily: 'Montserrat Semibold',
      fontSize: 20,
    );
  }

  static TextStyle poptextfield() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
    );
  }

  static TextStyle pophinttext() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
    );
  }
}


//popuptextfields use 20 inter.
//popuptitle use monserrat semibodl 20
//hint text textfield inter 20,
