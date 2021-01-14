import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
import 'package:mango_test/widget/addProductDialog.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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

KeyboardVisibilityController keyboardVisibilityController;

class _HomePageState extends State<HomePage> {
  bool IsBarcode = true;
  bool keyBoardOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    _BottomNavIdx = 0;
    keyboardVisibilityController = new KeyboardVisibilityController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  showBsheet(context);
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

  void showBsheet(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 526 / 812 * DeviceHeight,
            child: Padding(
              padding: EdgeInsets.all(DeviceWidth*0.03),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 3,
                        ),
                        Container(
                          child: Text(
                            '품목 입력',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Spacer(
                          flex: 14,
                        ),
                        RaisedButton(
                          onPressed: () => print('insert'),
                          child: Text('직접입력'),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15 * (DeviceHeight / 641),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          40 / 361 * DeviceWidth, 0, 40 / 361 * DeviceWidth, 0),
                      child: Text(
                        '식품의 바코드 또는 영수증을 촬영해주시면,\n 자동으로 냉장고에 품목을 업로드 해드립니다.',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15 * (DeviceHeight / 641),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          color:
                              IsBarcode ? Color(0xffF7C653) : Grey200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              if (!IsBarcode) {
                                IsBarcode = true;
                                Navigator.pop(context);
                                showBsheet(context);
                              }
                            });
                          },
                          child: Text('바코드'),
                        ),
                        RaisedButton(
                          color:
                              !IsBarcode ? Color(0xffF7C653) : Grey200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              if (IsBarcode) {
                                IsBarcode = false;
                                Navigator.pop(context);
                                showBsheet(context);
                              }
                            });
                          },
                          child: Text('영수증'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15 * (DeviceHeight / 641),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonTheme(
                          buttonColor: Colors.white,
                          height: 150 * (DeviceHeight / 641),
                          minWidth: 150 * (DeviceWidth / 361),
                          child: RaisedButton(
                            onPressed: () => print('camera'),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(Icons.photo_camera), Text('촬영하기')],
                            ),
                          ),
                        ),
                        ButtonTheme(
                          buttonColor: Colors.white,
                          height: 150 * (DeviceHeight / 641),
                          minWidth: 150 * (DeviceWidth / 361),
                          child: RaisedButton(
                            onPressed: () => print('album'),
                            child: Column(
                              children: [Icon(Icons.perm_media), Text('앨범에서 선택')],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20 * (DeviceHeight / 641),
                    ),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(
                    //       25 / 361 * DeviceWidth, 0, 30 / 361 * DeviceWidth, 0),
                    //   width: 334 / 375 * DeviceWidth,
                    //   color: Color(0xffbbbbbb),
                    //   child: FlatButton(
                    //     onPressed: () => Navigator.pop(context),
                    //     child: Text('취소'),
                    //   ),
                    // ),
                    ButtonBar(
                      // buttonPadding: EdgeInsets.fromLTRB(
                      //          25 / 361 * DeviceWidth, 0, 30 / 361 * DeviceWidth, 0),
                      buttonMinWidth: 334 / 375 * DeviceWidth,
                      buttonHeight: 50,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('취소'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
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
