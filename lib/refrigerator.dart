import 'package:flutter/material.dart';
import 'package:mango_test/model/exampleFood.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';

import 'app.dart';
import 'colors.dart';
import 'model/food.dart';

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();

  const Refrigerator({Key key}) : super(key: key);
}

class _RefrigeratorState extends State<Refrigerator> {
  var Ex1 = localRefrigerator.loadFood();
  List<Food> Foods = localRefrigerator.loadFood();

  List<Item> items = <Item>[
    Item(
      expandedValue: '1',
      headerValue: '냉장',
    ),
    Item(
      expandedValue: '2',
      headerValue: '냉동',
    ),
    Item(
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
            indicatorColor: Theme
                .of(context)
                .accentColor,
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
            Column(
              children: <Widget>[
                Text('전체 ${Foods.length}개'),
                Expanded(
                  child: content(Foods),
                ),
              ],
            ),
            content(Ex1),
          ],
        ),
      ),
    );
  }

  Widget content(List<Food> foods) {
    if (foods == null || foods.isEmpty) {
      return emptyList();
    } else {
      return ListView.builder(
        //padding: EdgeInsets.all(DeviceWidth * 0.05),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionPanelList(
            animationDuration: Duration(seconds: 1),
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      items[index].headerValue,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                body: ListTile(
                    title: Text('dl'),
                    subtitle: Text('To delete this panel, tap the trash can icon'),
                    trailing: Icon(Icons.delete),
                    onTap: () {
                    }),
                isExpanded: items[index].isExpanded,
              )
            ],
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !isExpanded;
              });
            },
          );
        },
      );

  }
  }

/*
  Widget contents(List<Food> foods) {
    if (foods == null || foods.isEmpty) {
      return emptyList();
    } else {
      return ListView.separated(
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
                        '${foods[index].foodimg}',
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
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                        ),
                        Text(
                          '21.01.07',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          if (foods[index].num > 0) {
                            foods[index].num--;
                            print('Foods[$index] = ${foods[index].num}');
                          }
                        });
                      });
                    },
                    child: foods[index].num == 0
                        ? Icon(Icons.delete_outline)
                        : Icon(Icons.remove),
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  Text('${foods[index].num}'),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        foods[index].num++;
                        print('Foods[$index] = ${foods[index].num}');
                      });
                    },
                    child: Icon(Icons.add),
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(
          height: 10,
        ),
      );
    }
  }

  Widget dDate(String txt) {
    return Container(
      width: DeviceWidth * 46 / 375,
      height: DeviceHeight * 30 / 812,
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .errorColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          txt,
          style: Theme
              .of(context)
              .textTheme
              .headline6
              .copyWith(color: Color(0xFFEE7243)),
        ),
      ),
    );
  } */

  Widget emptyList() {
    //TODO: Make Empty Information
    return Center(child: Text('냉장고 칸이 비어있습니다.'));
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}