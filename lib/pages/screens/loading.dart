import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Page'),
      ),
      body: Stack(
        children: [
          // Your main content widgets go here
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              child: Text('Simulate Loading'),
            ),
          ),

          // Loading screen widget
          if (isLoading) LoadingScreen(),
        ],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
