import 'package:flutter/material.dart';

class NewDesignPage extends StatelessWidget {
  const NewDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Adjust the height as needed
        child: AppBar(
          // Custom AppBar layout
          flexibleSpace: const SafeArea(
            // SafeArea widget to avoid status bar overlap
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              children: <Widget>[
                Text(
                  'HalfBaked',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Color(0xFFFFFFff) // Your desired font size
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Landing Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
