import 'package:mango_test/model/assets.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Home Page'),
      body: ListView(children: []),
      bottomNavigationBar: mainBottomNavigationBar().bottomNavigationBar,
      floatingActionButton: mainBottomNavigationBar().FAB,
      floatingActionButtonLocation: mainBottomNavigationBar().FABLocation,
    );
  }
}
