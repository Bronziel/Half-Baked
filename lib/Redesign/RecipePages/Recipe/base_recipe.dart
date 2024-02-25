import 'package:flutter/material.dart';
import '../../components/spacing/sizedboxes.dart';
import 'first_row_widget.dart';
import 'second_row_widget.dart';
import '../../styles_test/appbar.dart';

class NewDesignPage extends StatelessWidget {
  const NewDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0), child: NewAppbar()),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
