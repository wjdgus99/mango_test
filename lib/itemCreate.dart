import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango_test/app.dart';
import 'package:intl/intl.dart';

import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:mango_test/refrigerator.dart';

import 'colors.dart';
import 'model/users/food.dart';

class ItemCreate extends StatefulWidget {
  @override
  _ItemCreateState createState() => _ItemCreateState();
}

class _ItemCreateState extends State<ItemCreate> {
  String appTitle = '냉장고 품목 수정';
  int tabValue = 0;
  int radioValue = 0;
  final TextEditingController _nameTextController = new TextEditingController();

  List<Food> Foods = localRefrigerator.loadFood();

  final Map<int, Widget> tabBarWidget = const <int, Widget>{
    0: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '냉장',
          style: TextStyle(fontSize: 15),
        )),
    1: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '냉동',
          style: TextStyle(fontSize: 15),
        )),
    2: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '실온',
          style: TextStyle(fontSize: 15),
        )),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Grey200,
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
      ),
      body: ListView(
        //padding: EdgeInsets.all(DeviceWidth * 0.05),
        children: <Widget>[
          showTop(),
          SizedBox(
            height: 10,
          ),
          showInfo(),
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
                  '품목삭제',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
                onTap: () {},
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
                  showAlertDialog(
                      '품목 수정을 완료하시겠습니까?', '품목의 정보가 수정됩니다.', '취소', '완료');
                },
              ),
            ),
          ), //mj: this is for bottom 등록 button
        ],
      ),
    );
  }

  Widget showTop() {
    return Container(
        color: Colors.white,
        height: DeviceHeight * 0.08,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: DeviceHeight * 0.01),
            scrollDirection: Axis.horizontal,
            itemCount: Foods.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 50,
                      child: FlatButton(
                        color: Orange100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          '+',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        onPressed: () {},
                      ),
                    ));
              } else {
                return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: Foods[index].name.length * 25.0,
                      child: FlatButton(
                        color: Grey200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text('${Foods[index].name}'),
                        onPressed: () {},
                      ),
                    ));
              }
            }));
  }

  Widget showInfo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(DeviceWidth * 0.05),
      child: Column(
        children: <Widget>[
          Container(alignment: Alignment.topLeft, child: Text('제품정보')),
          SizedBox(
            height: DeviceHeight * 0.02,
          ),
          showTextField(_nameTextController, '품명'),
          SizedBox(
            height: DeviceHeight * 0.02,
          ),
          Row(
            children: <Widget>[
              showSelectField('수량'),
              SizedBox(
                width: DeviceHeight * 0.02,
              ),
              Expanded(child: showSelectField('카테고리')),
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
            width: DeviceWidth, // mj: TODO. DeviceWidth
            child: CupertinoSegmentedControl(
              //selectedColor: Colors.white,
              //unselectedColor: Grey200,
              padding: EdgeInsets.symmetric(vertical: DeviceHeight * 0.02),
              children: tabBarWidget,
              onValueChanged: (int val) {
                setState(() {
                  tabValue = val;
                });
              },
              groupValue: tabValue,
            ),
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
                    });
                  },
                ),
                Text('구매일'),
              ],
            ),
          ),
          radioValue == 0 ? showSelectField('유통기한') : showSelectField('구매일'),
        ],
      ),
    );
  }

  Widget showTextField(TextEditingController myController, String info) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
          child: Text(info), // myIcon is a 48px-wide widget.
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _nameTextController.clear();
          },
        ),
      ),
    );
  }

  Widget showSelectField(String info) {
    return Container(
      height: 60, // TODO. DeviceHeight
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
            Text('10'),
            info == '수량' ? SizedBox() : Expanded(child: SizedBox()),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                showCupertinoDatePicker();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(
      String title, String subtitle, String button1, String button2) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: DeviceHeight * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title),
                  Text(subtitle),
                  SizedBox(
                    height: DeviceHeight * 0.07,
                  ),
                  SizedBox(
                    width: DeviceWidth * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: DeviceHeight * 0.07,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                button1,
                              ),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: DeviceHeight * 0.02,
                        ),
                        Expanded(
                          child: Container(
                            height: DeviceHeight * 0.07,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    '/', ModalRoute.withName('/'));
                              },
                              child: Text(
                                button2,
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

  Future<dynamic> showCupertinoDatePicker() {
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
                  child: Text('구매일'),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    //initialDateTime: DateTime.now(),
                    initialDateTime:
                        DateFormat('yyyy-MM-dd').parse('2020-11-11'),
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
}
