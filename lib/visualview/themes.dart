import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData defaultTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      // Customize the AppBar theme properties
      color: Color.fromARGB(
          255, 233, 233, 238), // Set the background color of the AppBar
      iconTheme: IconThemeData(
          color: Colors
              .white), // Set the color of the AppBar icons (e.g., back button)
      toolbarTextStyle:
          TextStyle(color: Colors.white), // Set the color of the AppBar title
    ),
    // Define other properties of the default theme if needed
    primaryColor: const Color.fromARGB(255, 242, 242, 244),

    // Other theme properties...
  );

  // You can define other themes if needed
}
