import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';

import 'package:mango_test/colors.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
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

  //SpeedDialController _controller = SpeedDialController();

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
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appBars[_BottomNavIdx],
          body: _children[_BottomNavIdx],
          floatingActionButton: _buildFloatingActionButton(),
          // floatingActionButton: FloatingActionButton(
          //     child: Icon(Icons.add),
          //     onPressed: () {
          //       setState(() {
          //         showBottomSheet(context);
          //       });
          //     }),
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

  Widget _buildFloatingActionButton() {
    final TextStyle customStyle = TextStyle(inherit: false, color: Colors.black);
    final icons = [
      SpeedDialAction(
        child: Icon(Icons.mode_edit),
        label: Text('거래 품목 등록', style: customStyle),
        //backgroundColor: Theme.of(context).accentColor,
        //foregroundColor: Colors.white,
      ),
      SpeedDialAction(child: Icon(Icons.date_range), label: Text('냉장고 품목 등록', style: customStyle)),
    ];

    return SpeedDialFloatingActionButton(
      actions: icons,
      // Make sure one of child widget has Key value to have fade transition if widgets are same type.
      childOnFold: Icon(Icons.add, key: UniqueKey()),
      childOnUnfold: Icon(Icons.clear),
      useRotateAnimation: true,
      onAction: _onSpeedDialAction,
    );
  }

  _onSpeedDialAction(int selectedActionIndex) {
    print('$selectedActionIndex Selected');
    if(selectedActionIndex == 0){
      Navigator.pushNamed(context, ITEMREGIST);
    }
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
          text: '한눈에보기',
        ),
        Tab(
          text: '유통기한',
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
