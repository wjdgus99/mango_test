import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:mango_test/model/exampleFood.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:numberpicker/numberpicker.dart';

import 'app.dart';
import 'colors.dart';
import 'model/RefryItem.dart';
import 'model/food.dart';

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();

  const Refrigerator({Key key}) : super(key: key);
}

class _RefrigeratorState extends State<Refrigerator> {
  var Ex1 = localRefrigerator.loadFood();
  List<Food> Foods = localRefrigerator.loadFood();
  bool isAllFold = false;

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
            contents(Ex1),
          ],
        ),
      ),
    );
  }

  Widget showTap1(List<Food> foods) {
    return Column(
      children: <Widget>[
        Container(
            height: DeviceHeight * 0.07,
            padding: EdgeInsets.all(DeviceWidth * 0.04),
            child: Row(
              children: [
                Expanded(child: Text('전체 ${foods.length}개')),
                isAllFold == true
                    ? InkWell(
                        child: Text('모두 펼치기'),
                        onTap: () {
                          setState(() {
                            isAllFold = false;
                            items.forEach((element) {element.isExpanded = true;});
                          });
                        },
                      )
                    : InkWell(
                        child: Text('모두 접기'),
                        onTap: () {
                          setState(() {
                            isAllFold = true;
                            items.forEach((element) {element.isExpanded = false;});
                          });
                        },
                      ),
                SizedBox(
                  width: DeviceWidth * 0.05,
                ),
                InkWell(
                  child: Text('선택 ✓'),
                  onTap: () {},
                ),
              ],
            )),
        Expanded(
          child: ListView.builder(
            //padding: EdgeInsets.all(DeviceWidth * 0.05),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionPanelList(
                animationDuration: Duration(seconds: 1),
                children: [
                  ExpansionPanel(
                    body: contents(foods),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          items[index].headerValue,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: items[index].isExpanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    items[index].isExpanded = !items[index].isExpanded;
                  });
                },
              );
            },
          ),
        ),
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
          padding: EdgeInsets.all(DeviceWidth * 0.05),
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: DeviceHeight * 87 / 812,
              decoration: BoxDecoration(
                color: foods[index].DueDate > 3 ? Grey200 : Color(0xFFF9EBE5),
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
                            ? Positioned(top: 0, left: 5, child: dDate('OVER'))
                            : foods[index].DueDate <= 3
                                ? Positioned(
                                    top: 0,
                                    left: 5,
                                    child: dDate('D - ${foods[index].DueDate}'))
                                : SizedBox(),
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: DeviceHeight * 20 / 812),
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
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
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
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: DeviceHeight * 0.3,
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
              scrollController:
                  FixedExtentScrollController(initialItem: Foods[index].num),
            ),
          );
        });
  }
}
