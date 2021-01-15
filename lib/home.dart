import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/direct_input.dart';
import 'package:mango_test/nutrition.dart';
import 'package:mango_test/profile.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:mango_test/share.dart';
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

// final List<String> _title = [
//   '나의 냉장고',
//   'Share Page',
//   '영양성분',
//   '마이페이지',
// ];

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
          return Container(
            height: 526 * (DeviceHeight / 812),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  DeviceWidth * 0.03, 0, DeviceWidth * 0.03, 0),
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
                          onPressed: () {
                            Navigator.pop(context);
                            print('input');
                            showDirectInput(context);
                            print('output');
                          },
                          child: Text('직접입력'),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10 * (DeviceHeight / 812),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50 * (DeviceWidth / 812), 0,
                          50 * (DeviceWidth / 812), 0),
                      child: Text(
                        '식품의 바코드 또는 영수증을 촬영해주시면,\n 자동으로 냉장고에 품목을 업로드 해드립니다.',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 25 * (812 / DeviceHeight),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          color: IsBarcode ? Color(0xffF7C653) : Grey200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              if (!IsBarcode) {
                                IsBarcode = true;
                                Navigator.pop(context);
                                showBottomSheet(context);
                              }
                            });
                          },
                          child: Text('바코드'),
                        ),
                        RaisedButton(
                          color: !IsBarcode ? Color(0xffF7C653) : Grey200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            setState(() {
                              if (IsBarcode) {
                                IsBarcode = false;
                                Navigator.pop(context);
                                showBottomSheet(context);
                              }
                            });
                          },
                          child: Text('영수증'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40 * (DeviceHeight / 812),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonTheme(
                          buttonColor: Colors.white,
                          height: 150 * (DeviceHeight / 812),
                          minWidth: 150 * (375 / DeviceWidth),
                          child: RaisedButton(
                            onPressed: () => print('camera'),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.photo_camera),
                                Text('촬영하기')
                              ],
                            ),
                          ),
                        ),
                        ButtonTheme(
                          buttonColor: Colors.white,
                          height: 150 * (DeviceHeight / 812),
                          minWidth: 150 * (375 / DeviceWidth),
                          child: RaisedButton(
                            onPressed: () => print('album'),
                            child: Column(
                              children: [
                                Icon(Icons.perm_media),
                                Text('앨범에서 선택')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30 * (375 / DeviceHeight),
                    ),
                    ButtonBar(
                      buttonMinWidth: 334 / 375 * DeviceWidth,
                      buttonHeight: 48,
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

  final TextEditingController _nameController = TextEditingController();

  String dropdownValue = 'Option 1';
  DateTime selectedDueDate = DateTime.now();

  void showDirectInput(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 60),
                    Row(
                      children: [
                        // TODO: Text Style
                        Expanded(
                            child: Text(
                          '품목 입력',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                        RaisedButton(onPressed: null, child: Text('재촬영하기')),
                      ],
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
                        child: Text('품목 1'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 60,
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: '품목 이름'),
                        ),
                      ),
                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 60,
                          width: 120,
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text('수량'),
                                isExpanded: true,
                                value: dropdownValue,
                                items: <DropdownMenuItem>[
                                  DropdownMenuItem(
                                    value: 'Option 1',
                                    child: Text('1'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Option 2',
                                    child: Text('2'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Option 3',
                                    child: Text('3'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Option 4',
                                    child: Text('4'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 60,
                            child: InputDecorator(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                              child: InkWell(
                                onTap: () => _selectDueDate(context),
                                child: Row(children: [
                                  Expanded(
                                      child: Text(
                                    '유통기한',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Text(selectedDueDate
                                      .toString()
                                      .substring(0, 10)),
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.calendar_today)),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(110, 10, 110, 10),
                  child: RaisedButton(
                      // color: Orange500, //없으면 초록색 뜬다
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () => print('add product'),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [Icon(Icons.add), Text('품목 추가')]),
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () => print('Cancel'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text('취소'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            // color: Theme.of(context).accentColor,
                            // color: Colors.lightGreen,
                            onPressed: () => print('Save'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text('저장'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  _selectDueDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDueDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.input,
    );
    if (picked != null && picked != selectedDueDate)
      setState(() {
        selectedDueDate = picked;
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
