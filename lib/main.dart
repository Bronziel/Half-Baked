import 'package:fb2/Redesign/Testin_components/central_redirect/redirect.dart';
import 'package:fb2/pages/recipes/RecipePages/recipelistpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/screens/glist.dart';
import 'Redesign/styles_test/compos/buttone_template.dart';

import 'visualview/themes.dart';
import 'package:fb2/Redesign/RecipePages/base_recipe.dart';
import 'pages/screens/loading.dart';
import 'Redesign/glistredone.dart';
import 'Redesign/RecipePages/create_recipes.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTemplate(
            landingspace: TabbedPage(),
            buttonText: "Loading",
            buttonColor: const Color.fromARGB(255, 189, 12, 225),
          ),
          const ButtonTemplate(
            landingspace: GlistPage(),
            buttonText: "Food",
            buttonColor: Colors.orange,
          ),
          const ButtonTemplate(
            landingspace: RecipelistPage(),
            buttonText: "RecipeList",
            buttonColor: Color.fromARGB(255, 224, 17, 131),
          ),
          const ButtonTemplate(
            landingspace: NewDesignPage(),
            buttonText: "NewDesign",
            buttonColor: Color.fromARGB(255, 72, 255, 0),
          ),
          const ButtonTemplate(
            landingspace: BuildComponentPage(),
            buttonText: "Component",
            buttonColor: Color.fromARGB(255, 0, 30, 255),
          ),
          const ButtonTemplate(
            landingspace: RedonePage(),
            buttonText: "Redone",
            buttonColor: Color.fromARGB(255, 255, 0, 119),
          ),
          const ButtonTemplate(
            landingspace: CreateRecipesPage(),
            buttonText: "Create",
            buttonColor: Color.fromARGB(255, 248, 208, 10),
          )
        ],
      ),
    );
  }
}
