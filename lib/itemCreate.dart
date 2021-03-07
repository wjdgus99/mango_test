import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mango_test/app.dart';
import 'package:intl/intl.dart';
import 'package:mango_test/home.dart';
import 'package:mango_test/model/catogories.dart';

import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:mango_test/model/users/userRefrigerator.dart';
import 'package:mango_test/refrigerator.dart';
import 'package:provider/provider.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

import 'colors.dart';
import 'model/users/food.dart';

class ItemCreate extends StatefulWidget {
  @override
  _ItemCreateState createState() => _ItemCreateState();
}

class _ItemCreateState extends State<ItemCreate> {
  List<Food> addFoodList = new List<Food>();

  int tabValue = 0;
  int radioValue = 0;
  int currentSelected = 1; //mj: 선택된 식자재

  int selectedNum = 1; //수량

  final TextEditingController _nameTextController = new TextEditingController();

  // List<Food> Foods = localRefrigerator.loadFood();

  final List<String> categories = imageMatching.keys.toList();

  @override
  Widget build(BuildContext context) {
    String appTitle = ModalRoute.of(context).settings.arguments;

    if (appTitle == null) {
      appTitle = '냉장고 품목 추가';
    } else if (appTitle.contains('수정')) {
      addFoodList = modifyFoodList;
      if (addFoodList.length != 0 &&
          addFoodList[currentSelected - 1].isSelected) {
        print(addFoodList.length);
        radioValue = 1;
      } else {
        radioValue = 0;
      }
    } else {}

    // List<Food> modifyFoods = ModalRoute.of(context).settings.arguments;

    return Consumer<UserRefrigerator>(
        builder: (context, userRefrigerator, child) {
      return Scaffold(
        backgroundColor: Grey200,
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
        ),
        body: ListView(
          //padding: EdgeInsets.all(DeviceWidth * 0.05),
          children: <Widget>[
            showTop(addFoodList, userRefrigerator),
            SizedBox(
              height: 10,
            ),
            showInfo(addFoodList, userRefrigerator),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: DeviceHeight * 0.07,
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: DeviceWidth * 0.05),
                child: InkWell(
                  child: Text(
                    '품목 삭제',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                  onTap: () {
                    setState(() {
                      showDeleteAlert(
                          userRefrigerator, addFoodList[currentSelected - 1]);
                      if (addFoodList.length == 1) {
                        appTitle = '냉장고 품목 등록';
                        // addFoodList.removeAt(currentSelected - 1);
                      }
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(DeviceWidth * 0.05),
              child: Container(
                height: DeviceHeight * 0.08,
                child: FlatButton(
                  //padding: EdgeInsets.symmetric(vertical: 20),
                  color: Theme.of(context).accentColor,
                  child: Text('등록'),
                  onPressed: () {
                    showAlertDialog(userRefrigerator, addFoodList);
                  },
                ),
              ),
            ), //mj: this is for bottom 등록 button
          ],
        ),
      );
    });
  }

  Widget showTop(List<Food> foods, UserRefrigerator userRefrigerator) {
    return Container(
        color: Colors.white,
        height: DeviceHeight * 0.08,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: DeviceHeight * 0.01),
            scrollDirection: Axis.horizontal,
            itemCount: foods.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: EdgeInsets.all(8),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: FlatButton(
                        color: Orange100.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          '+',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Orange700),
                        ),
                        onPressed: () {
                          setState(() {
                            //TODO. Foods.Length 하나 더 추가해야될 듯. 하면서 내용은 없는 DB로...내용없는 DB하나 더 추가되도록!!!
                          });
                        },
                      ),
                    ));
              } else {
                return Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: FlatButton(
                        color: currentSelected == index
                            ? Theme.of(context).primaryColor
                            : Grey200.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            side: currentSelected == index
                                ? BorderSide(color: Orange700)
                                : BorderSide(
                                    color: Color(0xff666666).withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '${foods[index - 1].name}',
                            style: currentSelected == index
                                ? Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Orange700)
                                : Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .color
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w400),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            currentSelected = index;
                          });
                        },
                      ),
                    ));
              }
            }));
  }

  Widget showInfo(List<Food> foods, UserRefrigerator userRefrigerator) {
    return Container(
      color: White,
      padding: EdgeInsets.all(DeviceWidth * 0.05),
      child: Column(
        children: <Widget>[
          Container(alignment: Alignment.topLeft, child: Text('제품정보')),
          SizedBox(
            height: DeviceHeight * 0.02,
          ),
          TextField(
            controller: _nameTextController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(),
              hintText: foods[currentSelected - 1].name,
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                child: Text('품명'), // myIcon is a 48px-wide widget.
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _nameTextController.clear();
                },
              ),
            ),
          ),
          SizedBox(
            height: DeviceHeight * 0.02,
          ),
          Row(
            children: <Widget>[
              showSelectField(
                  addFoodList, '수량', foods[currentSelected - 1].num.toString()),
              SizedBox(
                width: DeviceHeight * 0.02,
              ),
              Expanded(
                  child: showSelectField(addFoodList, '카테고리',
                      foods[currentSelected - 1].category)),
            ],
          ),
          Container(
              padding: EdgeInsets.only(top: DeviceHeight * 0.03),
              alignment: Alignment.topLeft,
              child: Text('보관방법')),
          SizedBox(
            width: DeviceHeight * 0.02,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(
                  0, DeviceHeight * 0.02, 0, DeviceHeight * 0.02),
              width: DeviceWidth, // mj: TODO. DeviceWidth
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: foods[currentSelected - 1].storeLevel == 0
                        ? BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(color: Orange700),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(5),
                            ))
                        : BoxDecoration(
                            color: Grey200.withOpacity(0.5),
                            border: Border.all(
                                color: Color(0xff666666).withOpacity(0.2)),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(5),
                            )),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          foods[currentSelected - 1].storeLevel = 0;
                          print(foods[currentSelected - 1].storeLevel);
                        });
                      },
                      child: Text(
                        '냉장',
                        style: foods[currentSelected - 1].storeLevel == 0
                            ? Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Orange700, fontWeight: FontWeight.w400)
                            : Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .color
                                    .withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: foods[currentSelected - 1].storeLevel == 1
                        ? BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(color: Orange700),
                          )
                        : BoxDecoration(
                            color: Grey200.withOpacity(0.5),
                            border: Border.all(
                                color: Color(0xff666666).withOpacity(0.2)),
                          ),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          foods[currentSelected - 1].storeLevel = 1;
                        });
                      },
                      child: Text(
                        '냉동',
                        style: foods[currentSelected - 1].storeLevel == 1
                            ? Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Orange700, fontWeight: FontWeight.w400)
                            : Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .color
                                    .withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: foods[currentSelected - 1].storeLevel == 2
                        ? BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(color: Orange700),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(5),
                            ))
                        : BoxDecoration(
                            color: Grey200.withOpacity(0.5),
                            border: Border.all(
                                color: Color(0xff666666).withOpacity(0.2)),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(5),
                            )),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          foods[currentSelected - 1].storeLevel = 2;
                        });
                      },
                      child: Text(
                        '실온',
                        style: foods[currentSelected - 1].storeLevel == 2
                            ? Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Orange700, fontWeight: FontWeight.w400)
                            : Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .color
                                    .withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              )
              // CupertinoSegmentedControl(
              //   //selectedColor: Colors.white,
              //   //unselectedColor: Grey200,
              //   padding: EdgeInsets.symmetric(vertical: DeviceHeight * 0.02),
              //   children: tabBarWidget,
              //   onValueChanged: (int val) {
              //     setState(() {
              //       foods[currentSelected - 1].storeLevel = val;
              //       tabValue = foods[currentSelected - 1].storeLevel;
              //     });
              //   },
              //   groupValue: tabValue,
              // ),
              ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: Text('표시기준')),
                Radio(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: (int val) {
                    setState(() {
                      radioValue = val;
                      foods[currentSelected - 1].isSelected = false;
                    });
                  },
                ),
                Text('유통기한'),
                Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (int val) {
                    setState(() {
                      radioValue = val;
                      foods[currentSelected - 1].isSelected = true;
                    });
                  },
                ),
                Text('구매일'),
              ],
            ),
          ),
          radioValue == 0
              ? showSelectField(addFoodList, '유통기한',
                  '${foods[currentSelected - 1].shelfLife.year}년 ${foods[currentSelected - 1].shelfLife.month}월 ${foods[currentSelected - 1].shelfLife.day}일')
              : showSelectField(addFoodList, '구매일',
                  '${foods[currentSelected - 1].purchaseDate.year}년 ${foods[currentSelected - 1].purchaseDate.month}월 ${foods[currentSelected - 1].purchaseDate.day}일'),
        ],
      ),
    );
  }

  Widget showSelectField(List<Food> foods, String info, String content) {
    return Container(
      height: 60 * DeviceHeight / 812,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Text(info), // myIcon is a 48px-wide widget.
            ),
            Text(content),
            info == '수량' ? SizedBox() : Expanded(child: SizedBox()),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                if (info == '수량')
                  showCupertinoPicker(foods, 1);
                else if (info == '카테고리')
                  showCategoryPicker(foods);
                else
                  showDatePicker(foods[currentSelected - 1]);
                // showCupertinoDatePicker(info);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(
      UserRefrigerator userRefrigerator, List<Food> foods) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: DeviceHeight * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '품목 수정을 완료하시겠습니까?',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: DeviceHeight * 0.01),
                  Text('품목의 정보가 수정됩니다.',
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(
                    height: DeviceHeight * 0.05,
                  ),
                  SizedBox(
                    width: DeviceWidth * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: DeviceHeight * 0.06,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                '취소',
                              ),
                              color: Theme.of(context).buttonColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: DeviceHeight * 0.02,
                        ),
                        Expanded(
                          child: Container(
                            height: DeviceHeight * 0.06,
                            child: FlatButton(
                              onPressed: () {
                                userRefrigerator.LoadFoods();
                                foods.clear();
                                Navigator.pushNamed(context, HOME);
                              },
                              child: Text(
                                '완료',
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showCupertinoPicker(List<Food> foods, int index) {
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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (int newValue) {
                      setState(() {
                        foods[currentSelected - 1].num = newValue + 1;
                      });
                    },
                    children: List<Widget>.generate(20, (int index) {
                      return Text(
                        (++index).toString(),
                        style: Theme.of(context).textTheme.headline5,
                      );
                    }),
                    scrollController: FixedExtentScrollController(
                        initialItem: foods[index - 1].num - 1),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<dynamic> showCategoryPicker(List<Food> foods) {
    int currentSelectedCategory = 0; // mj: 선택된 카테고리

    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: DeviceHeight * 0.4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '카테고리',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  //TODO: MJ: 여기 지우지말고 남겨놓으셈 만일을 대비해서.
                  // child: GridView.count(
                  //     padding: EdgeInsets.all(DeviceWidth * 0.05),
                  //     crossAxisCount: 3,
                  //     childAspectRatio: (80 / 40),
                  //     children: List.generate(12, (index) {
                  //       return Container(
                  //         padding: EdgeInsets.all(DeviceHeight * 0.008),
                  //         child: FlatButton(
                  //           color: index == currentSelectedCategory
                  //               ? Theme.of(context).accentColor
                  //               : Grey200,
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10)),
                  //           child: Text('${category[index]}'),
                  //           onPressed: () {
                  //             setState(() {
                  //               Foods[currentSelected].category =
                  //                   category[index];
                  //               currentSelectedCategory = index;
                  //             });
                  //           },
                  //         ),
                  //       );
                  //     }
                  //     )),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: CustomRadioButton(
                      enableShape: true,
                      horizontal: true,
                      buttonSpace: 5,
                      buttonColor: Colors.white,
                      selectedColor: Theme.of(context).accentColor,
                      buttonWidth: DeviceWidth * 0.27,
                      buttonHeight: DeviceHeight * 0.05,
                      fontSize: 12.0,
                      initialSelection: CallIndex(foods[currentSelected - 1]),
                      radioButtonValue: (value, index) {
                        setState(() {
                          foods[currentSelected - 1].category = value;

                          print(
                              'name - ${foods[currentSelected - 1].name} / category -  ${foods[currentSelected - 1].category}');
                        });
                      },
                      buttonLables: categories,
                      buttonValues: categories,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<dynamic> showDatePicker(Food food) {
    return DatePicker.showDatePicker(context,
        showTitleActions: true,
        locale: LocaleType.ko,
        currentTime: food.isSelected ? food.purchaseDate : food.shelfLife,
        onConfirm: (date) {
      print('confirm $date'); //TODO.
      setState(() {
        if (food.isSelected) {
          food.purchaseDate = date;
          print('purchaseDate = ${food.purchaseDate}');
        } else {
          food.shelfLife = date;
          print('shelfLife = ${food.shelfLife}');
        }
      });
    });
  }

  Future<dynamic> showCupertinoDatePicker(String info) {
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
                    info,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    //initialDateTime: DateFormat('yyyy-MM-dd').parse('2020-11-11'),
                    onDateTimeChanged: (DateTime newdate) {
                      print(newdate);
                    },
                    maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showDeleteAlert(UserRefrigerator userRefrigerator, Food food) {
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
                              List<Food> deleteFood = new List<Food>();
                              deleteFood.add(food);
                              print('before : ${addFoodList.length}');
                              userRefrigerator.DeleteFoodList(deleteFood);
                              print('after : ${addFoodList.length}');

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
