import 'package:flutter/material.dart';

class StyleUtils {
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
      fontSize: 30,
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
}
