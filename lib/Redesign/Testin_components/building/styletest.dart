import 'package:flutter/material.dart';

class StyleUtilstest {
  static TextStyle titelstylepop() {
    return const TextStyle(
      fontFamily: 'Montserrat Semibold',
      fontWeight: FontWeight.w800, // ExtraBold
      fontSize: 20,
    );
  }

  static TextStyle labelstylepop() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
      color: Color(0xFF161414),
    );
  }

  static TextStyle textfieldstylepop() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
      color: Color(0xFF161414),
    );
  }

  static TextStyle hintstylepop() {
    return const TextStyle(
      fontFamily: 'inter',
      fontSize: 20,
    );
  }

  static OutlineInputBorder enabledborderstyle() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9896F1)),
    );
  }

  static Color cardcolorgrey() => const Color(0xFFD9D9D9);
  static Color mainncolor() => const Color(0xFF9896F1);
}

class Utilstest {
  static SizedBox smallpopbox(Widget child) {
    return SizedBox(
      width: 460,
      height: 140,
      child: child,
    );
  }

  static SizedBox bigpopbox(Widget child) {
    return SizedBox(
      width: 460,
      height: 205,
      child: child,
    );
  }

  static SizedBox stepspopbox(Widget child) {
    return SizedBox(
      width: 460 / 205 * 310,
      height: 310,
      child: child,
    );
  }

  static SizedBox ingpop(Widget child) {
    return SizedBox(
      width: 460,
      height: 140 * 2,
      //140
      child: child,
    );
  }

  static Icon info() {
    return const Icon(
      Icons.info_outline,
      size: 20,
    );
  }

  static Icon infotext(Widget child) {
    return const Icon(
      Icons.info_outline,
      size: 20,
    );
  }
}
