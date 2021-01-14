import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/share.dart';
import 'model/nutrition/chart.dart';
import 'home.dart';
import 'login.dart';
import 'model/nutrition/series.dart';

final LOGIN = '/login';
final HOME = '/home';
final PROFILE = '/profile';
final NUTRITION = '/nutrition';
final SHARE = '/share';

var DeviceHeight;
var DeviceWidth;

final ThemeData _MangoTheme = _buildMangoTheme();

ThemeData _buildMangoTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Green400,
    primaryColor: Orange500,

    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Green500,
      colorScheme: base.colorScheme.copyWith(
        secondary: Orange500,
      ),
    ),
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
        ),
      )
      .apply(
        fontFamily: 'NotoSansKR',
      );
}

class MangoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mango Demo',
      home: HomePage(),
      theme: _MangoTheme,
      initialRoute: LOGIN,
      routes: {
        LOGIN: (context) => LoginPage(),
        HOME: (context) => HomePage(),
        '/chart': (context) => Chart(),
        PROFILE: (context) => Profile(),
        NUTRITION: (context) => Nutrition(),
        SHARE: (context) => Share(),
      },
    );
  }
}
