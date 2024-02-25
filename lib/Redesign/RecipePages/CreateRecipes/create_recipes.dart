import 'package:flutter/material.dart';

import '../../components/spacing/sizedboxes.dart';
import 'create_first_row.dart';
import 'create_second_row.dart';
import '../../styles_test/appbar.dart';

class CreateRecipesPage extends StatelessWidget {
  const CreateRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: NewAppbar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Height20StandardWidget(),
              CreateFirstRowWidget(),
              Height20StandardWidget(),
              CreateSecondRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
