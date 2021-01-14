import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
import 'package:mango_test/widget/addProductDialog.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [
    Refrigerator(),
    Share(),
    Nutrition(),
    Profile()
  ];

  final List<String> _title = [
    'Home Page',
    'Share Page',
    'Nutrition Page',
    'Profile Page',
  ];

  final List<IconData> iconList = <IconData>[
    Icons.home,
    Icons.people,
    Icons.fact_check,
    Icons.person,
  ];

  var _BottomNavIdx = 0;

  @override
  void initState() {
    // TODO: implement initState
    _BottomNavIdx = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
          titleSpacing: 40, //TODO: Maybe erase this.
          title: Text(_title[_BottomNavIdx]),
          actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
        ),
        body: _children[_BottomNavIdx],
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddProductDialog();
                })),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          notchSmoothness: NotchSmoothness.softEdge,
          activeIndex: _BottomNavIdx,
          gapLocation: GapLocation.center,
          onTap: (index) {
            setState(() {
              _BottomNavIdx = index;
            });
          },
        ));
  }
}
