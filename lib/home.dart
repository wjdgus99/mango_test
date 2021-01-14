import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
import 'package:mango_test/widget/addProductDialog.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';

import 'app.dart';

final List<Widget> _children = [
  Refrigerator(),
  Share(),
  Nutrition(),
  Profile()
];

final List<String> _title = [
  '나의 냉장고',
  'Share Page',
  '영양성분',
  '마이페이지',
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
  basicAppBar(),
  basicAppBar(),
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
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          appBar: _appBars[_BottomNavIdx],
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
          )),
    );
  }
}

Widget basicAppBar() {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
    centerTitle: true,
    title: Text(_title[_BottomNavIdx]),
    actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
  );
}

Widget homeAppBar() {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
    centerTitle: true,
    //TODO: Maybe erase this.
    title: Text(_title[_BottomNavIdx]),
    actions: [IconButton(icon: Icon(Icons.apps), onPressed: null)],
    bottom: TabBar(
      tabs: <Tab>[
        Tab(text: '냉장',),
        Tab(text: '냉동',),
        Tab(text: '실온',),
      ],
    ),
  );
}
