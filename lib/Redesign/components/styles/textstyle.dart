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

//recipe page textstyle
//text colorblack color: Color(0xFF161414),
//text colorwhite color: Color(0xFFFFFFFF),

class PaintText {
  static Color white() {
    return const Color(0xFFFFFFFF);
  }

  static Color black() {
    return const Color(0xFF161414);
  }
}

class Fontsize {
  static const double bigfont = 40;
  static const double avgfont = 24;
  static const double popfont = 20;
}

class FontFamily {
  static const String bigTitle = 'Pacifico';
  static const String popTitle = 'Montserrat Semibold'; //FontWeight.w800,
  static const String poptext = 'inter';
}

class StyleTextRecipe {
  static TextStyle titelrecipe() {
    return TextStyle(
      fontFamily: FontFamily.bigTitle,
      fontSize: Fontsize.bigfont,
      color: PaintText.white(),
    );
  }

  static TextStyle descriptionrecipe() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Fontsize.avgfont,
      color: PaintText.white(),
    );
  }

  static TextStyle porttotalrecipe() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Fontsize.avgfont,
      color: PaintText.black(),
    );
  }

  static TextStyle ingboxtitel() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: Fontsize.avgfont,
      color: PaintText.black(),
    );
  }

  static TextStyle ingbox() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: Fontsize.avgfont,
      color: PaintText.white(),
    );
  }

  static TextStyle stepsnumber() {
    return TextStyle(
      fontFamily: FontFamily.bigTitle,
      fontSize: Fontsize.bigfont,
      color: PaintText.black(),
    );
  }

  static TextStyle stepstext() {
    return TextStyle(
      fontSize: Fontsize.avgfont,
      color: PaintText.black(),
    );
  }
}

//popupboxes
class TextPopStyle {
//titel
  static TextStyle poptitle() {
    return TextStyle(
      fontFamily: FontFamily.popTitle,
      fontWeight: FontWeight.w800,
      fontSize: Fontsize.popfont,
      color: PaintText.black(),
    );
  }

//label pop
  static TextStyle labelstylepop() {
    return TextStyle(
      fontFamily: FontFamily.poptext,
      fontSize: Fontsize.popfont,
      color: PaintText.black(),
    );
  }

//texten som skrivs
  static TextStyle poptextfield() {
    return TextStyle(
      fontFamily: FontFamily.poptext,
      fontSize: Fontsize.popfont,
      color: PaintText.black(),
    );
  }

//text som hintar vad som kan skrivas som ett exmplet
  static TextStyle pophinttext() {
    return TextStyle(
      fontFamily: FontFamily.poptext,
      fontSize: Fontsize.popfont,
      color: PaintText.black(),
    );
  }
}

//popuptextfields use 20 inter.
//popuptitle use monserrat semibodl 20
//hint text textfield inter 20,

//alla dom icons med logo i
class Iconstext {
  static TextStyle icontextview() {
    return const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700);
  }
}
