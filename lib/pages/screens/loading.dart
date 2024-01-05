import 'package:flutter/material.dart';
import '../recipes/RecipePages/allrecipes.dart';

class TabbedPage extends StatefulWidget {
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabs = [
    const RecipelistPage(),
    const Center(child: Text('Tab 1')), //Tab 1
    const Center(child: Text('Tab 2')), //Tab 2
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.one_k),
                ), //Tab 1
                Tab(
                  icon: Icon(Icons.two_k),
                ), //Tab 2
                Tab(
                    icon: Icon(Icons.restaurant),
                    text: 'Recipes'), //Tab 3 - Recipe list
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabs,
            ),
          ),
        ],
      ),
    );
  }
}
