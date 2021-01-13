import 'package:mango_test/model/appBar.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Home Page'),
      body: ListView(children: []),
      bottomNavigationBar: bottomNavigationBar(context),
      floatingActionButton: FAB(context),
      floatingActionButtonLocation: FABLocation,
    );
  }
}
