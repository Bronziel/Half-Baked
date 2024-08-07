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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTemplate(
            landingspace: TabbedPage(),
            buttonText: "Loading",
            buttonColor: Color.fromARGB(255, 246, 243, 86),
          ),
          ButtonTemplate(
            landingspace: GlistPage(),
            buttonText: "Food",
            buttonColor: Colors.orange,
          ),
          ButtonTemplate(
            landingspace: RecipelistPage(),
            buttonText: "RecipeList",
            buttonColor: Color.fromARGB(255, 224, 17, 131),
          ),
          ButtonTemplate(
            landingspace: NewDesignPage(),
            buttonText: "NewDesign",
            buttonColor: Color.fromARGB(255, 72, 255, 0),
          ),
          ButtonTemplate(
            landingspace: BuildComponentPage(),
            buttonText: "Component",
            buttonColor: Color.fromARGB(255, 0, 30, 255),
          ),
          ButtonTemplate(
            landingspace: RedonePage(),
            buttonText: "Redone",
            buttonColor: Color.fromARGB(255, 255, 0, 119),
          ),
          ButtonTemplate(
            landingspace: CreateRecipesPage(),
            buttonText: "Create",
            buttonColor: Color.fromARGB(255, 97, 248, 10),
          )
        ],
      ),
    );
  }
}
