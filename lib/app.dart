import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/profile.dart';

import 'home.dart';
import 'login.dart';
import 'model/assets.dart';

final LOGIN = '/login';
final HOME = '/home';
final PROFILE = '/profile';

final ThemeData _MangoTheme = _buildMangoTheme();

ThemeData _buildMangoTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Green400,
    primaryColor: Orange500,

    //  buttonTheme: base.buttonTheme.copyWith(
    //    buttonColor: Green400,
    //    colorScheme: base.colorScheme.copyWith(
    //      secondary: Orange500,
    //    ),
    //  ),
    // buttonBarTheme: base.buttonBarTheme.copyWith(
    //   buttonTextTheme: ButtonTextTheme.accent,
    // ),
    // primaryIconTheme: base.iconTheme.copyWith(
    //     color: Green400,
    // ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Orange500),
    toggleableActiveColor: Green500,
    textTheme: _buildMangoTextTheme(base.textTheme),
    cursorColor: Orange500,
    primaryTextTheme: _buildMangoTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildMangoTextTheme(base.accentTextTheme),
    iconTheme: base.iconTheme.copyWith(color: Orange500),
    primaryIconTheme: base.iconTheme.copyWith(color: Orange500),
  );
}

TextTheme _buildMangoTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText1.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),)
      .apply(
        fontFamily: 'Oregano',
      );
}

class MangoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mango Demo',
      theme: _MangoTheme,
      home: Profile(),
      //initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/profile': (context) => Profile(),
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
