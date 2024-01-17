import 'package:flutter/material.dart';

class Utils {
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
