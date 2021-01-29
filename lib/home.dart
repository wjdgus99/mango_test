import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';

import 'package:mango_test/colors.dart';
import 'package:mango_test/camera.dart';
import 'package:mango_test/friendList.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentPage = 'refrigerator';
  List<String> pageKeys = [
    'refrigerator',
    'share',
    'add',
    'nutrition',
    'mypage'
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'refrigerator': GlobalKey<NavigatorState>(),
    'share': GlobalKey<NavigatorState>(),
    'add': GlobalKey<NavigatorState>(),
    'nutrition': GlobalKey<NavigatorState>(),
    'mypage': GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      print('1');
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        print('2');
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != 'refrigerator') {
            _selectTab('refrigerator', 1);

            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: [
          _buildOffstageNavigator('refrigerator'),
          _buildOffstageNavigator('share'),
          _buildOffstageNavigator('add'),
          _buildOffstageNavigator('nutrition'),
          _buildOffstageNavigator('mypage'),
        ]),
                  floatingActionButton: _buildFloatingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.grey[400],
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '냉장고'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '나눔 광장'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: '등록'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: '영양 성분'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이 페이지'),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
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


  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
  // print('length : ${Foods.length}');
  //
  // print('food 1 : ${Foods[0].name}');
      ],
    );
  }
}

// class TabNavigatorRoutes {
//   static const String root = '/';
// static const String detail = '/detail';
// }

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == 'refrigerator')
      child = Refrigerator();
    else if (tabItem == 'share')
      child = Share();
    else if (tabItem == 'add')
      child = FriendList();
    else if (tabItem == 'nutrition')
      child = Nutrition();
    else if (tabItem == 'mypage') child = Profile();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
