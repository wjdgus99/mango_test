import 'package:flutter/material.dart';

import 'app.dart';
import 'colors.dart';
import 'model/food.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';

class ItemSelect extends StatefulWidget {
  @override
  _ItemSelectState createState() => _ItemSelectState();
}

class _ItemSelectState extends State<ItemSelect> {
  List<Food> Foods = localRefrigerator.loadFood();
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래 품목 선택'),
        actions: [
          Center(
              child: InkWell(
            child: Text('선택'),
            onTap: () {},
          )),
        ],
      ),
      body: _buildItemList(Foods),
    );
  }

  Widget _buildItemList(List<Food> foods) {
    if (foods == null || foods.isEmpty) {
      print('OH');
    } else {
      return ListView.separated(
        //padding: EdgeInsets.all(DeviceWidth * 0.05),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //height: DeviceHeight * 87 / 812,
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
                      // Image.asset(
                      //   '${foods[index].foodimg}',
                      //   //width: DeviceWidth * 82 / 375,
                      //   //height: DeviceHeight * 67 / 812,
                      //   fit: BoxFit.contain,
                      // ),
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
                    //padding: EdgeInsets.only(top: DeviceHeight * 20 / 812),
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
                  Stack(
                    children: [
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
                  foods[index].isSelected == false
                      ? SizedBox(
                          width: 23,
                          child: RaisedButton(
                            shape: CircleBorder(),
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                num++;
                                foods[index].isSelected = true;
                                foods[index].selectedNum = num;
                                print(index);
                              });
                            },
                          ),
                        )
                      : SizedBox(
                          width: 23,
                          child: RaisedButton(
                            child: Center(
                                child: Text('${foods[index].selectedNum}')),
                            shape: CircleBorder(),
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              setState(() {
                                num--;
                                foods[index].isSelected = false;
                                foods[index].selectedNum = num;
                              });
                            },
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
      //width: DeviceWidth * 46 / 375,
      //height: DeviceHeight * 30 / 812,
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
}
