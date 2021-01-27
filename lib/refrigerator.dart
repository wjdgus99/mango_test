import 'package:flutter/material.dart';
import 'package:mango_test/model/exampleFood.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';

import 'app.dart';
import 'colors.dart';
import 'model/food.dart';

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();
}

class _RefrigeratorState extends State<Refrigerator> {
  var Ex1, Ex2;
  List<Food> Foods = localRefrigerator.loadFood();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        contents(Foods),
        contents(Ex1),
        contents(Ex2),
      ],
    );
  }

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
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          '21.01.07',
                          style: Theme.of(context).textTheme.subtitle2,
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
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
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
}

/*class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();
}

class _RefrigeratorState extends State<Refrigerator> {
  final List<String> entries = <String>['레몬', '파프리카', '오이', '고추'];
  final List<int> numbers = <int>[1, 1, 1, 1];
  final List<String> images = <String>[
    'images/foods/lemon.png',
    'images/foods/paprika.png',
    'images/foods/cucumber.png',
    'images/foods/pepper.png'
  ];
  final List<String> dDay = <String>['OVER', 'D-1', '', ''];

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        contents(),
        contents(),
        contents(),
      ],
    );
  }

  Widget contents() {
    return ListView.separated(
      padding: EdgeInsets.all(DeviceWidth * 0.05),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: DeviceHeight * 87 / 812,
          decoration: BoxDecoration(
            color: dDay[index] == 'OVER' ? Color(0xFFF9EBE5) : Grey200,
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
                      '${images[index]}',
                      width: DeviceWidth * 82/ 375,
                      height: DeviceHeight * 67/ 812,
                      fit: BoxFit.contain,
                    ),
                    dDay[index] == ''
                        ? SizedBox()
                        : Positioned(top:0, left:5, child: dDate('${dDay[index]}')),
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.only(top: DeviceHeight*20/812),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${entries[index]}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '21.01.07',
                        style: Theme.of(context).textTheme.subtitle2,
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
                        if (numbers[index] == 0) {
                        } else {
                          numbers[index]--;
                        }
                      });
                    });
                  },
                  child: Icon(Icons.remove),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                Text('${numbers[index]}'),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      numbers[index]++;
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
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
  }

  Widget dDate(String txt) {
    return Container(
      width: DeviceWidth * 46/ 375,
      height: DeviceHeight * 30/ 812,
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
}*/
