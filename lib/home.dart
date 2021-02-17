import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';
import 'package:mango_test/Analytics/analytics.dart';

import 'package:mango_test/colors.dart';
import 'package:mango_test/camera.dart';
import 'package:mango_test/Friend/friendList.dart';
import 'package:mango_test/Profile/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/Share/share.dart';
import 'package:flutter/material.dart';

import 'HHome.dart';
import 'app.dart';
import 'itemRegistration.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Refrigerator(),
    Share(),
    ItemRegistration(),
    Analytics(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // floatingActionButton: _buildFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey[400],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '냉장고'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '나눔 광장'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '등록'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '냉장고 분석'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이 페이지'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    final TextStyle customStyle =
        TextStyle(inherit: false, color: Colors.black);
    final icons = [
      SpeedDialAction(
        child: Icon(Icons.mode_edit),
        label: Text('거래 품목 등록', style: customStyle),
      ),
      SpeedDialAction(
          child: Icon(Icons.date_range),
          label: Text('냉장고 품목 등록', style: customStyle)),
    ];

    return SpeedDialFloatingActionButton(
      actions: icons,
      childOnFold: Icon(Icons.add, key: UniqueKey()),
      childOnUnfold: Icon(Icons.clear),
      useRotateAnimation: false,
      onAction: _onSpeedDialAction,
    );
  }

  _onSpeedDialAction(int selectedActionIndex) {
    print('$selectedActionIndex Selected');
    if (selectedActionIndex == 0) {
      Navigator.pushNamed(context, ITEMREGIST);
    }
  }
}
