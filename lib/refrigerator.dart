import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:mango_test/itemCreate.dart';
import 'package:mango_test/itemSelect.dart';
import 'package:mango_test/test_model/exampleShareFood.dart';
import 'package:mango_test/model/catogories.dart';
// import 'package:mango_test/model/exampleFood.dart';
import 'package:mango_test/model/users/user.dart' as localUser;
import 'package:mango_test/model/users/userRefrigerator.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

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

List<Food> modifyFoodList = new List<Food>();

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
    return Consumer2<localUser.User, UserRefrigerator>(
      builder: (context, user, userRefrigerator, child) {
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
                showTap1(userRefrigerator),
                showTap2(userRefrigerator),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showTap1(UserRefrigerator userRefrigerator) {
    List<Food> foods = userRefrigerator.Foods;
    if (foods == null || foods.isEmpty) {
      return Column(
        children: [
          Spacer(),
          Center(
              child: Column(
            children: [
              Image.asset(
                'images/emptyRefrigerator.png',
                height: DeviceHeight * 130 / 812,
              ),
              Text(
                '냉장고 칸이 비어있습니다.',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .color
                        .withOpacity(0.6)),
              )
            ],
          )),
          Spacer(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(DeviceWidth * 0.04),
              child: Row(
                children: [
                  Container(
                      child: Text(
                    '전체 ${foods.length}개',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Color(0xFF666666)),
                  )),
                  isEdited == true
                      ? Container(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '선택 ${modifyFoodList.length}개',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Color(0xFF666666)),
                          ))
                      : Text(''),
                  Spacer(),
                  isEdited == false
                      ? Row(
                          children: <Widget>[
                            isAllFold == true
                                ? InkWell(
                                    child: Text(
                                      '모두 펼치기',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
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
                                    child: Text('모두 접기',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
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
                              child: Text('선택 ✓',
                                  style: Theme.of(context).textTheme.caption),
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
                              child: Text('수정',
                                  style: modifyFoodList.length > 0
                                      ? Theme.of(context).textTheme.caption
                                      : Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: Color(0xFF929292),
                                          )),
                              onTap: () {
                                if (modifyFoodList.length <= 0) {
                                } else {
                                  Navigator.pushNamed(context, ITEMCREATE,
                                      arguments: modifyFoodList);
                                }
                              },
                            ),
                            SizedBox(
                              width: DeviceWidth * 0.05,
                            ),
                            InkWell(
                              child: Text(
                                '삭제',
                                style: modifyFoodList.length > 0
                                    ? Theme.of(context).textTheme.caption
                                    : Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(color: Color(0xFF929292)),
                              ),
                              onTap: () {
                                setState(() {
                                  if (modifyFoodList.length > 0) {
                                    showDeleteAlert(userRefrigerator);
                                    isEdited = !isEdited;
                                  } else {}
                                });
                              },
                            ),
                            SizedBox(
                              width: DeviceWidth * 0.05,
                            ),
                            InkWell(
                              child: Text('취소',
                                  style: Theme.of(context).textTheme.caption),
                              onTap: () {
                                setState(() {
                                  isEdited = false;
                                  modifyFoodList.clear();
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
                    contents(userRefrigerator, index),
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
              },
            ),
          ),
        ],
      );
    }
  }

  Widget showTap2(UserRefrigerator userRefrigerator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: DeviceWidth,
          height: DeviceHeight * 0.15,
          color: Theme.of(context).errorColor.withOpacity(0.5),
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
                          child: Text(
                            "전체",
                            style: Theme.of(context).textTheme.button,
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text("유통기한",
                              style: Theme.of(context).textTheme.button),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("구매일",
                              style: Theme.of(context).textTheme.button),
                          value: 2,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _filterValue = value;
                        });
                      }),
                ),
                Expanded(child: SizedBox()),
                isEdited == false
                    ? InkWell(
                        child: Text(
                          '선택 ✓',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        onTap: () {
                          setState(() {
                            isEdited = true;
                          });
                        },
                      )
                    : Row(
                        children: <Widget>[
                          InkWell(
                            child: Text('수정',
                                style: Theme.of(context).textTheme.caption),
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
                            child: Text('삭제',
                                style: Theme.of(context).textTheme.caption),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: DeviceWidth * 0.05,
                          ),
                          InkWell(
                            child: Text('취소',
                                style: Theme.of(context).textTheme.button),
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
        Expanded(child: contents2(userRefrigerator, 4)),
      ],
    );
  }

  Widget contents(UserRefrigerator userRefrigerator, int idx) {
    List<Food> foods = idx == 0
        ? userRefrigerator.RefrigerationFoods
        : idx == 1
            ? userRefrigerator.FrozenFoods
            : userRefrigerator.RoomTempFoods;

    if (foods == null || foods.isEmpty) {
      return emptyStorageList();
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
                    color: isEdited
                        ? modifyFoodList.contains(foods[index])
                            ? Orange100
                            : foods[index].DueDate > 0
                                ? Grey200
                                : foods[index].isSelected
                                    ? Blue100.withOpacity(0.6)
                                    : Red200.withOpacity(0.4)
                        : foods[index].DueDate > 0
                            ? Grey200
                            : foods[index].isSelected
                                ? Blue100.withOpacity(0.6)
                                : Red200.withOpacity(0.4),
                    border: Border.all(
                      color: isEdited
                          ? modifyFoodList.contains(foods[index])
                              ? Orange500
                              : Color(0xFFF9F8F6)
                          : Color(0xFFF9F8F6),
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
                              'images/category/${CallImage(foods[index])}',
                              width: DeviceWidth * 82 / 375,
                              height: DeviceHeight * 67 / 812,
                              fit: BoxFit.contain,
                            ),
                            foods[index].DueDate <= 0
                                ? foods[index].isSelected
                                    ? Positioned(
                                        top: 0,
                                        left: 5,
                                        child: dDate(
                                            foods[index].isSelected, 'STALE'))
                                    : Positioned(
                                        top: 0,
                                        left: 5,
                                        child: dDate(
                                            foods[index].isSelected, 'OVER'))
                                : foods[index].DueDate <= 7
                                    ? foods[index].isSelected
                                        ? SizedBox()
                                        : Positioned(
                                            top: 0,
                                            left: 5,
                                            child: dDate(false,
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
                                foods[index].isSelected
                                    ? '${foods[index].registerDate.year}년 ${foods[index].registerDate.month}월 ${foods[index].registerDate.day}일 등록 '
                                    : '${foods[index].shelfLife.year}년 ${foods[index].shelfLife.month}월 ${foods[index].shelfLife.day}일 까지 ',
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(
                                        color: foods[index].isSelected
                                            ? Blue500
                                            : Theme.of(context).errorColor),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        InkWell(
                            child: Text(
                              '${foods[index].num} ▾',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            onTap: () {
                              showCupertinoPicker(userRefrigerator, idx, index);
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
                                color: !modifyFoodList.contains(foods[index])
                                    ? Colors.grey
                                    : Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    if (!modifyFoodList
                                        .contains(foods[index])) {
                                      modifyFoodList.add(foods[index]);
                                      print('${modifyFoodList.length}');
                                    } else {
                                      modifyFoodList.remove(foods[index]);
                                      print('${modifyFoodList.length}');
                                    }
                                  });
                                },
                              ),
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

  Widget contents2(UserRefrigerator userRefrigerator, int idx) {
    List<Food> foods = userRefrigerator.Foods;
    bool isTitle = true;

    if (foods == null || foods.isEmpty) {
      return emptyStorageList();
    } else {
      return Container(
        height: DeviceHeight * 0.5, //mj: ListView 내의 ListView = Height가 정해진다.
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: DeviceWidth * 0.05),
            itemCount: foods.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return isTitle
                  ? Text('유통기한 만료 7일 이내')
                  : Stack(
                      children: [
                        Container(
                          height: DeviceHeight * 87 / 812,
                          decoration: BoxDecoration(
                            color: foods[index].DueDate > 3
                                ? Grey200
                                : Color(0xFFF9EBE5),
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
                                            top: 0,
                                            left: 5,
                                            child: dDate(true, 'OVER'))
                                        : foods[index].DueDate <= 3
                                            ? Positioned(
                                                top: 0,
                                                left: 5,
                                                child: dDate(true,
                                                    'D - ${foods[index].DueDate}'))
                                            : SizedBox(),
                                  ],
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: DeviceHeight * 20 / 812),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${foods[index].name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        '21년 01월 07일 까지',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
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
                                      showCupertinoPicker(
                                          userRefrigerator, idx, index);
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
                                            if (foods[index].isSelected ==
                                                false) {
                                              num++;
                                              foods[index].isSelected = true;
                                              // foods[index].selectedNum = num;
                                            } else {
                                              num--;
                                              foods[index].isSelected = false;
                                              // foods[index].selectedNum = num;
                                            }
                                          });
                                        },
                                      ),
                                      foods[index].isSelected == false
                                          ? SizedBox()
                                          : Text(/*'${foods[index].num}'*/ ''),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (isTitle == true) isTitle = false;
              return const SizedBox(
                height: 10,
              );
            }),
      );
    }
  }

  Widget dDate(bool isSelected, String txt) {
    return Container(
      width: isSelected ? DeviceWidth * 55 / 375 : DeviceWidth * 46 / 375,
      height: DeviceHeight * 30 / 812,
      decoration: BoxDecoration(
        color: isSelected ? Blue100 : Red200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          txt,
          style: isSelected
              ? Theme.of(context).textTheme.headline6.copyWith(color: Blue500)
              : Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Theme.of(context).errorColor),
        ),
      ),
    );
  }

  Widget emptyStorageList() {
    //TODO: Make Empty Information
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              'images/emptyRefrigerator.png',
              height: DeviceHeight * 80 / 812,
            ),
            Text(
              '냉장고 칸이 비어있습니다.',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .color
                      .withOpacity(0.6)),
            )
          ],
        ));
  }

  Future<dynamic> showCupertinoPicker(
      UserRefrigerator userRefrigerator, int listIndex, int index) {
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
                  child: Text(
                    '수량',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (int newValue) {
                      setState(() {
                        if (listIndex == 0) {
                          userRefrigerator.RefrigerationFoods[index].num =
                              newValue + 1;
                        } else if (listIndex == 1) {
                          userRefrigerator.FrozenFoods[index].num =
                              newValue + 1;
                        } else {
                          userRefrigerator.RoomTempFoods[index].num =
                              newValue + 1;
                        }
                      });
                    },
                    children: List<Widget>.generate(20, (int index) {
                      return Text(
                        (++index).toString(),
                        style: Theme.of(context).textTheme.headline5,
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

  void showDeleteAlert(UserRefrigerator userRefrigerator) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: DeviceWidth * 332 / 375,
              height: DeviceHeight * 180 / 812,
              child: Column(
                children: [
                  Spacer(
                    flex: 11,
                  ),
                  Text(
                    '해당 품목을 삭제하시겠습니까?',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text('품목의 모든 정보가 삭제됩니다.',
                      style: Theme.of(context).textTheme.subtitle2),
                  Spacer(
                    flex: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      ButtonTheme(
                        minWidth: 140,
                        height: 45,
                        buttonColor: Theme.of(context).buttonColor,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '취소',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                      Spacer(),
                      ButtonTheme(
                        minWidth: 140,
                        height: 45,
                        buttonColor: Orange500,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            setState(() {
                              userRefrigerator.DeleteFoodList(modifyFoodList);
                              modifyFoodList.clear();
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            '삭제',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
