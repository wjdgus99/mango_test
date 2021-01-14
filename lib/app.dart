import 'package:flutter/material.dart';
import 'package:mango_test/nutrition.dart';
import 'chart.dart';
import 'home.dart';
import 'login.dart';

import 'model/assets.dart';
import 'model/series.dart';
import 'model/appBar.dart';

final LOGIN = '/login';
final HOME = '/home';

class MangoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mango Demo',
      home: HomePage(),
      initialRoute: LOGIN,
      routes: {
        LOGIN: (context) => LoginPage(),
        HOME: (context) => HomePage(),
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
      bottomNavigationBar: bottomNavigationBar(context),
      floatingActionButton: FAB(context),
      floatingActionButtonLocation: FABLocation,
    );
  }
}
