import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData defaultTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      // Customize the AppBar theme properties
      color: Color(0xFF9896F1), // Set the background color of the AppBar
      iconTheme: IconThemeData(
          color: Colors
              .white), // Set the color of the AppBar icons (e.g., back button)
      toolbarTextStyle:
          TextStyle(color: Colors.white), // Set the color of the AppBar title
    ),
    // Define other properties of the default theme if needed
    primaryColor: const Color(0xFF9896F1),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    // Other theme properties...
  );

  // You can define other themes if needed
}
