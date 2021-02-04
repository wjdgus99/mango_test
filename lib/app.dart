import 'package:flutter/material.dart';
import 'package:mango_test/camera.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/Friend/friendList.dart';
import 'package:mango_test/itemCreate.dart';
import 'package:mango_test/itemRegistration.dart';
import 'package:mango_test/itemSelect.dart';
import 'package:mango_test/login.dart';
import 'package:mango_test/Profile/profile.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/Share/share.dart';
import 'package:mango_test/widget/addFood.dart';
import 'package:mango_test/widget/addFoodDirect.dart';
import 'model/nutrition/chart.dart';
import 'home.dart';

final LOGIN = '/login';
final HOME = '/home';
final PROFILE = '/profile';
final NUTRITION = '/nutrition';
final SHARE = '/share';
final CAMERA = '/camera';
final DIRECTINPUT = '/directInput';
final ADDINPUT = '/addFood';
final CHART = '/chart';
final FRIENDLIST = '/friendList';
final ITEMREGIST = '/itemRegistration';
final ITEMSELECT = '/itemSelect';
final ITEMCREATE = '/itemCreate';
var DeviceHeight;
var DeviceWidth;

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
        CHART: (context) => Chart(),
        ADDINPUT: (context) => AdditionalInput(),
        DIRECTINPUT: (context) => DirectInput(),
        PROFILE: (context) => Profile(),
        NUTRITION: (context) => Nutrition(),
        SHARE: (context) => Share(),
        CAMERA: (context) => Camera(),
        FRIENDLIST: (context) => FriendList(),
        ITEMREGIST: (context) => ItemRegistration(),
        ITEMSELECT: (context) => ItemSelect(),
        ITEMCREATE: (context) => ItemCreate(),
      },
    );
  }
}

final ThemeData _MangoTheme = _buildMangoTheme();

ThemeData _buildMangoTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Orange500,
    primaryColor: Colors.white,
    hoverColor: Orange500,
    errorColor: Red200,
    toggleableActiveColor: Orange500,
    cursorColor: Orange500,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Grey200,
      colorScheme: base.colorScheme.copyWith(
        secondary: Orange500,
      ),
    ),

    /* show Data Picker */
    colorScheme: ColorScheme.light().copyWith(primary: Orange500),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Orange500,
      foregroundColor: Colors.black,
    ),
    textTheme: _buildMangoTextTheme(base.textTheme),
    primaryTextTheme: _buildMangoTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildMangoTextTheme(base.accentTextTheme),
    iconTheme: base.iconTheme.copyWith(color: Black),
    primaryIconTheme: base.iconTheme.copyWith(color: Black),
  );
}

TextTheme _buildMangoTextTheme(TextTheme base) {
  return base
      .copyWith(
        /* headline6: Text of AppBar */
        headline6: base.headline6.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        /* subtitle1: title of ListTile */
        subtitle1: base.subtitle1.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        /* subtitle2: substitle of ListTile*/
        subtitle2: base.subtitle2.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),

        /* headline5: hintText of ProfilePage(subtitle 2_KR)*/
        headline5: base.headline5.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        /* headline4: dialog title*/
        headline4: base.headline4.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),
        /* button: all of button + tabs */
        button: base.button.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        /* bodyText2: dialog text */
        bodyText2: base.button.copyWith(
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
        bodyColor: Colors.black,
        displayColor: Colors.black,
      );
}
