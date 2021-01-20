import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/widget/addFoodBottomSheet.dart';
import 'app.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'model/food.dart';

final List<Widget> _children = [
  Refrigerator(),
  Share(),
  Nutrition(),
  Profile()
];

final List<IconData> iconList = <IconData>[
  Icons.home,
  Icons.people,
  Icons.fact_check,
  Icons.person,
];

final List<Widget> _appBars = [
  homeAppBar(),
  basicAppBar(),
  nutritionAppBar(),
  profileAppBar(),
];

var _BottomNavIdx = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    _BottomNavIdx = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('length : ${Foods.length}');
    //
    // print('food 1 : ${Foods[0].name}');

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appBars[_BottomNavIdx],
          body: _children[_BottomNavIdx],
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  showBottomSheet(context);
                });
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            activeColor: Color(0xffF3AF4B),
            inactiveColor: Color.fromARGB(25, 0, 0, 0),
            icons: iconList,
            notchSmoothness: NotchSmoothness.softEdge,
            activeIndex: _BottomNavIdx,
            gapLocation: GapLocation.center,
            onTap: (index) {
              setState(() {
                _BottomNavIdx = index;
              });
            },
          )),
    );
  }

  void showBottomSheet(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ShowBottomSheet();
        });
  }
}

Widget basicAppBar() {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
    centerTitle: true,
    title: Text('MANGO'),
    actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
  );
}

Widget homeAppBar() {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
    centerTitle: true,
    //TODO: Maybe erase this.
    title: Text('나의 냉장고'),
    actions: [IconButton(icon: Icon(Icons.apps), onPressed: null)],
    bottom: TabBar(
      indicatorColor: Orange500,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
      tabs: <Tab>[
        Tab(
          text: '냉장',
        ),
        Tab(
          text: '냉동',
        ),
        Tab(
          text: '실온',
        ),
      ],
    ),
  );
}

Widget profileAppBar() {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
    centerTitle: true,
    title: Text('마이페이지'),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Orange500,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () => print('Save Profile'),
          child: Text('저장'),
        ),
      )
    ],
  );
}

Widget nutritionAppBar() {
  return AppBar(
    centerTitle: true,
    leading: Text(' '),
    title: Text('영양성분'),
    actions: [
      IconButton(icon: Icon(Icons.share), onPressed: () => print('share'))
    ],
  );
}
