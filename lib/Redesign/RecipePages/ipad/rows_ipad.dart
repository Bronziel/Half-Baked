import 'package:flutter/material.dart';

import '../../components/styles/spacing/sizedboxes.dart';
import '../base_recipe.dart';

class NewDesignPageIpad extends StatelessWidget {
  const NewDesignPageIpad({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              FirstRowWidget(),
              Height20StandardWidget(),
              SecondRowWidget(),
            ],
          ),
        ),
      
    );
  }
}