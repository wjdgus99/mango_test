import 'package:flutter/material.dart';
import 'package:mango_test/nutrition.dart';
import 'chart.dart';
import 'home.dart';
import 'login.dart';
import 'model/assets.dart';
import 'model/series.dart';

final LOGIN = '/login';
final HOME = '/home';

class MangoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mango Demo',
      home: Nutrition(),
      //initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/chart': (context) => Chart(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Main Page'),
      body: ListView(children: []),
      bottomNavigationBar: mainBottomNavigationBar().bottomNavigationBar,
      floatingActionButton: mainBottomNavigationBar().FAB,
      floatingActionButtonLocation: mainBottomNavigationBar().FABLocation,
    );
  }
}
