import 'package:fb2/Redesign/Testin_components/central_redirect/redirect.dart';
import 'package:fb2/pages/recipes/RecipePages/recipelistpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/screens/glist.dart';

import 'visualview/themes.dart';
import 'package:fb2/Redesign/RecipePages/Recipe/base_recipe.dart';
import 'pages/screens/loading.dart';
import 'Redesign/glistredone.dart';
import 'Redesign/CreateRecipes/create_recipes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const LandingPage({super.key});

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: RedoneButton(), // Add this line
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CreateButton(), // Add this line
          ),
        ],
      ),
    );
  }
}

class LoadingPageButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const LoadingPageButton({
    super.key,
    this.buttonText = 'Loading',
    this.buttonColor = const Color.fromARGB(255, 189, 12, 225),
  });

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
    super.key,
    this.buttonText = 'Food',
    this.buttonColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GlistPage()),
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
    super.key,
    this.buttonText = 'RecipeList',
    this.buttonColor = const Color.fromARGB(255, 224, 17, 131),
  });

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
    super.key,
    this.buttonText = 'NewDesign',
    this.buttonColor = const Color.fromARGB(255, 72, 255, 0),
  });

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
    super.key,
    this.buttonText = 'Component',
    this.buttonColor = const Color.fromARGB(255, 0, 30, 255),
  });

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

class RedoneButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const RedoneButton({
    super.key,
    this.buttonText = 'Redone',
    this.buttonColor = const Color.fromARGB(255, 255, 0, 119),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RedonePage()),
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

class CreateButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const CreateButton({
    super.key,
    this.buttonText = 'Create',
    this.buttonColor = const Color.fromARGB(255, 248, 208, 10),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateRecipesPage()),
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
