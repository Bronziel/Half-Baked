import 'package:flutter/material.dart';

class NewDesignPage extends StatelessWidget {
  const NewDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          title: const Text(
            'HalfBaked',
          ),
          centerTitle: true,
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
