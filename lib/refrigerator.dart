import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:mango_test/itemCreate.dart';
import 'package:mango_test/itemSelect.dart';
import 'package:mango_test/model/exampleFood.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:numberpicker/numberpicker.dart';

import 'app.dart';
import 'colors.dart';
import 'model/RefryItem.dart';
import 'model/users/food.dart';

List<RefryItem> items = <RefryItem>[
  RefryItem(
    expandedValue: '1',
    headerValue: '냉장',
  ),
  RefryItem(
    expandedValue: '2',
    headerValue: '냉동',
  ),
  RefryItem(
    expandedValue: '3',
    headerValue: '실온',
  ),
];

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();

  const Refrigerator({Key key}) : super(key: key);
}

class _RefrigeratorState extends State<Refrigerator> {
  var Ex1 = localRefrigerator.loadFood();
  List<Food> Foods = localRefrigerator.loadFood();
  bool isAllFold = false; //mj: 모두 접기 버튼 누름 확인
  bool isEdited = false; //mj: 선택버튼 누름 확인
  int foldNum = 0; //mj: 접혀있는 개
  int num = 0;
  int _filterValue = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Text(''),
          centerTitle: true,
          title: Text('나의 냉장고'),
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
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
        ),
        body: TabBarView(
          children: [
            showTap1(Foods),
            showTap2(Foods),
          ],
        ),
      ),
    );
  }

  Widget showTap1(List<Food> foods) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(DeviceWidth * 0.04),
            child: Row(
              children: [
                Expanded(child: Text('전체 ${foods.length}개')),
                isEdited == false
                    ? Row(
                        children: <Widget>[
                          isAllFold == true
                              ? InkWell(
                                  child: Text('모두 펼치기'),
                                  onTap: () {
                                    setState(() {
                                      isAllFold = false;
                                      foldNum = 0;
                                      items.forEach((element) {
                                        element.isExpanded = true;
                                      });
                                    });
                                  },
                                )
                              : InkWell(
                                  child: Text('모두 접기'),
                                  onTap: () {
                                    setState(() {
                                      isAllFold = true;
                                      foldNum = items.length;
                                      items.forEach((element) {
                                        element.isExpanded = false;
                                      });
                                    });
                                  },
                                ),
                          SizedBox(
                            width: DeviceWidth * 0.05,
                          ),
                          InkWell(
                            child: Text('선택 ✓'),
                            onTap: () {
                              setState(() {
                                isEdited = true;
                                isAllFold = false;
                                items.forEach((element) {
                                  element.isExpanded = true;
                                });
                              });
                            },
                          ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          InkWell(
                            child: Text('수정'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ItemCreate()));
                            },
                          ),
                          SizedBox(
                            width: DeviceWidth * 0.05,
                          ),
                          InkWell(
                            child: Text('삭제'),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: DeviceWidth * 0.05,
                          ),
                          InkWell(
                            child: Text('취소'),
                            onTap: () {
                              setState(() {
                                isEdited = false;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            )),
        Expanded(
          child: ListView.builder(
            //padding: EdgeInsets.all(DeviceWidth * 0.05),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                key: GlobalKey(),
                title: Text('${items[index].headerValue}'),
                initiallyExpanded: items[index].isExpanded,
                children: <Widget>[
                  contents(foods),
                ],
                onExpansionChanged: ((newState) {
                  setState(() {
                    items[index].isExpanded = !items[index].isExpanded;
                    if (items[index].isExpanded == false)
                      foldNum++;
                    else
                      foldNum--;
                    if (foldNum == items.length)
                      isAllFold = true;
                    else if (foldNum == 0) isAllFold = false;
                  });
                }),
              );
              // return ExpansionPanelList(
              //   animationDuration: Duration(seconds: 1),
              //   children: [
              //     ExpansionPanel(
              //       body: contents(foods),
              //       headerBuilder: (BuildContext context, bool isExpanded) {
              //         return Container(
              //           padding: EdgeInsets.all(10),
              //           child: Text(
              //             items[index].headerValue,
              //             style: TextStyle(
              //               fontSize: 18,
              //             ),
              //           ),
              //         );
              //       },
              //       isExpanded: items[index].isExpanded,
              //     )
              //   ],
              //   expansionCallback: (int item, bool status) {
              //     setState(() {
              //       items[index].isExpanded = !items[index].isExpanded;
              //       if (items[index].isExpanded == false)
              //         foldNum++;
              //       else
              //         foldNum--;
              //       if (foldNum == items.length)
              //         isAllFold = true;
              //       else if (foldNum == 0) isAllFold = false;
              //     });
              //   },
              // );
            },
          ),
        ),
      ],
    );
  }

  Widget showTap2(List<Food> foods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: DeviceWidth,
          height: DeviceHeight * 0.15,
          color: Theme.of(context).errorColor,
        ),
        Container(
            padding: EdgeInsets.all(DeviceWidth * 0.04),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                      value: _filterValue,
                      items: [
                        DropdownMenuItem(
                          child: Text("전체"),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text("유통기한"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("구매일"),
                          value: 2,
                        ),
                      ],
                      onChanged: (value){
                        setState(() {
                          _filterValue = value;
                        });
                      }),
                ),
                Expanded(child: SizedBox()),
                isEdited == false
                    ? InkWell(
                        child: Text('선택 ✓'),
                        onTap: () {
                          setState(() {
                            isEdited = true;
                          });
                        },
                      )
                    : Row(
                        children: <Widget>[
                          InkWell(
                            child: Text('수정'),
                            onTap: () {
                              isEdited = false;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ItemCreate()));
                            },
                          ),
                          SizedBox(
                            width: DeviceWidth * 0.05,
                          ),
                          InkWell(
                            child: Text('삭제'),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: DeviceWidth * 0.05,
                          ),
                          InkWell(
                            child: Text('취소'),
                            onTap: () {
                              setState(() {
                                isEdited = false;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            )),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: DeviceWidth * 0.04),
        //   child: Text('유통기한 만료 7일 이내'),
        // ),
        Expanded(child: contents2(foods)),
      ],
    );
  }

  Widget contents(List<Food> foods) {
    if (foods == null || foods.isEmpty) {
      return emptyList();
    } else {
      return Container(
        height: DeviceHeight * 0.5, //mj: ListView 내의 ListView = Height가 정해진다.
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: DeviceWidth * 0.05),
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Container(
                  height: DeviceHeight * 87 / 812,
                  decoration: BoxDecoration(
                    color:
                        foods[index].DueDate > 3 ? Grey200 : Color(0xFFF9EBE5),
                    border: Border.all(
                      color: Color(0xFFF9F8F6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/foods/lemon.png',
                              width: DeviceWidth * 82 / 375,
                              height: DeviceHeight * 67 / 812,
                              fit: BoxFit.contain,
                            ),
                            foods[index].DueDate <= 0
                                ? Positioned(
                                    top: 0, left: 5, child: dDate('OVER'))
                                : foods[index].DueDate <= 3
                                    ? Positioned(
                                        top: 0,
                                        left: 5,
                                        child: dDate(
                                            'D - ${foods[index].DueDate}'))
                                    : SizedBox(),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: DeviceHeight * 20 / 812),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${foods[index].name}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '21년 01월 07일 까지',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        InkWell(
                            child: Text('${foods[index].num} ▾'),
                            onTap: () {
                              showCupertinoPicker(index);
                            }),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                isEdited == true
                    ? Positioned(
                        top: -5,
                        right: 8,
                        child: SizedBox(
                          width: 18,
                          child: Stack(
                            children: [
                              RaisedButton(
                                shape: CircleBorder(),
                                color: foods[index].isSelected == false
                                    ? Colors.grey
                                    : Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    if (foods[index].isSelected == false) {
                                      num++;
                                      foods[index].isSelected = true;
                                      foods[index].selectedNum = num;
                                      print(index);
                                    } else {
                                      num--;
                                      foods[index].isSelected = false;
                                      foods[index].selectedNum = num;
                                    }
                                  });
                                },
                              ),
                              foods[index].isSelected == false
                                  ? SizedBox()
                                  : Text('${foods[index].selectedNum}'),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
        ),
      );
    }
  }

  Widget contents2(List<Food> foods){
    bool isTitle = true;

    if (foods == null || foods.isEmpty) {
      return emptyList();
    } else {
      return Container(
        height: DeviceHeight * 0.5, //mj: ListView 내의 ListView = Height가 정해진다.
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: DeviceWidth * 0.05),
          itemCount: foods.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return isTitle ?
                Text('유통기한 만료 7일 이내')
                :Stack(
              children: [
                Container(
                  height: DeviceHeight * 87 / 812,
                  decoration: BoxDecoration(
                    color:
                    foods[index].DueDate > 3 ? Grey200 : Color(0xFFF9EBE5),
                    border: Border.all(
                      color: Color(0xFFF9F8F6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/foods/lemon.png',
                              width: DeviceWidth * 82 / 375,
                              height: DeviceHeight * 67 / 812,
                              fit: BoxFit.contain,
                            ),
                            foods[index].DueDate <= 0
                                ? Positioned(
                                top: 0, left: 5, child: dDate('OVER'))
                                : foods[index].DueDate <= 3
                                ? Positioned(
                                top: 0,
                                left: 5,
                                child: dDate(
                                    'D - ${foods[index].DueDate}'))
                                : SizedBox(),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          padding:
                          EdgeInsets.only(top: DeviceHeight * 20 / 812),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${foods[index].name}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                '21년 01월 07일 까지',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        InkWell(
                            child: Text('${foods[index].num} ▾'),
                            onTap: () {
                              showCupertinoPicker(index);
                            }),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                isEdited == true
                    ? Positioned(
                  top: -5,
                  right: 8,
                  child: SizedBox(
                    width: 18,
                    child: Stack(
                      children: [
                        RaisedButton(
                          shape: CircleBorder(),
                          color: foods[index].isSelected == false
                              ? Colors.grey
                              : Theme.of(context).accentColor,
                          onPressed: () {
                            setState(() {
                              if (foods[index].isSelected == false) {
                                num++;
                                foods[index].isSelected = true;
                                foods[index].selectedNum = num;
                                print(index);
                              } else {
                                num--;
                                foods[index].isSelected = false;
                                foods[index].selectedNum = num;
                              }
                            });
                          },
                        ),
                        foods[index].isSelected == false
                            ? SizedBox()
                            : Text('${foods[index].selectedNum}'),
                      ],
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index){
            if (isTitle == true) isTitle = false;
            return const SizedBox(
              height: 10,
            );
          }
        ),
      );
    }
  }

  Widget dDate(String txt) {
    return Container(
      width: DeviceWidth * 46 / 375,
      height: DeviceHeight * 30 / 812,
      decoration: BoxDecoration(
        color: Theme.of(context).errorColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          txt,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Color(0xFFEE7243)),
        ),
      ),
    );
  }

  Widget emptyList() {
    //TODO: Make Empty Information
    return Center(child: Text('냉장고 칸이 비어있습니다.'));
  }

  Future<dynamic> showCupertinoPicker(int index) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: DeviceHeight * 0.3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('수량'),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (int newValue) {
                      setState(() {
                        Foods[index].num = newValue + 1;
                      });
                    },
                    children: List<Widget>.generate(20, (int index) {
                      return Text(
                        (++index).toString(),
                      );
                    }),
                    scrollController: FixedExtentScrollController(
                        initialItem: Foods[index].num),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
