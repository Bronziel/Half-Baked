import 'package:fb2/Redesign/Testin_components/buildcomponents.dart';
import 'package:fb2/pages/recipes/RecipePages/recipelistpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/screens/glist.dart';
import 'pages/recipes/RecipePages/recipelistpage.dart';
import 'visualview/themes.dart';
import 'package:fb2/Redesign/RecipePages/Recipe/FakeRecipe.dart';

import 'pages/screens/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym and Food App',
      theme: AppThemes.defaultTheme,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym and Food App')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: LoadingPageButton(),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: GlistButton(),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: RecipeListButton(),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: NewDesignButton(), // Add this line
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ComponentButton(), // Add this line
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class LoadingPageButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const LoadingPageButton({
    Key? key,
    this.buttonText = 'Loading',
    this.buttonColor = const Color.fromARGB(255, 189, 12, 225),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TabbedPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}

class GlistButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const GlistButton({
    Key? key,
    this.buttonText = 'Food',
    this.buttonColor = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GlistPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}

class RecipeListButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const RecipeListButton({
    Key? key,
    this.buttonText = 'RecipeList',
    this.buttonColor = const Color.fromARGB(255, 224, 17, 131),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RecipelistPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}

class NewDesignButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const NewDesignButton({
    Key? key,
    this.buttonText = 'NewDesign',
    this.buttonColor = const Color.fromARGB(255, 72, 255, 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewDesignPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}

class ComponentButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const ComponentButton({
    Key? key,
    this.buttonText = 'Component',
    this.buttonColor = const Color.fromARGB(255, 0, 30, 255),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BuildComponentPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        minimumSize: const Size(double.infinity, 64.0),
        backgroundColor: buttonColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}
