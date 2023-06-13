import 'package:flutter/material.dart';
import '../recipes/RecipePages/recipelistpage.dart'; //Assuming your RecipeListPage.dart file is in the same directory
import '../../visualview/appbar/customappbar.dart';

class TabbedPage extends StatefulWidget {
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage> {
  final List<Widget> _tabs = [
    Center(child: Text('Tab 1')), //Tab 1
    Center(child: Text('Tab 2')), //Tab 2
    RecipelistPage(), //Tab 3 - Recipe list
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbed Page'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.one_k), text: 'Tab 1'), //Tab 1
              Tab(icon: Icon(Icons.two_k), text: 'Tab 2'), //Tab 2
              Tab(
                  icon: Icon(Icons.restaurant),
                  text: 'Recipes'), //Tab 3 - Recipe list
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}
