import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../app.dart';
import '../colors.dart';
import '../direct_input.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class ShowBottomSheet extends StatefulWidget {
  @override
  _ShowBottomSheetState createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  bool IsBarcode = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 526 * (DeviceHeight / 812),
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(DeviceWidth * 0.03, 0, DeviceWidth * 0.03, 0),
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
                padding: EdgeInsets.fromLTRB(
                    50 * (DeviceWidth / 812), 0, 50 * (DeviceWidth / 812), 0),
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
                      onPressed: () => {Navigator.pushNamed(context, CAMERA)},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.photo_camera), Text('촬영하기')],
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
                        children: [Icon(Icons.perm_media), Text('앨범에서 선택')],
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
  }

  void showDirectInput(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DirectInput();
        });
  }
}

class DirectInput extends StatefulWidget {
  @override
  _DirectInputState createState() => _DirectInputState();
}

class _DirectInputState extends State<DirectInput> {
  final TextEditingController _nameController = TextEditingController();

  String dropdownValue = 'Option 1';
  DateTime selectedDueDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 32 * (DeviceHeight / 812),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO: Text Style
                  Spacer(),
                  Text(
                    '품목 입력',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      '재촬영하기',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 32 * (DeviceHeight / 812),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(29 * (DeviceWidth / 375), 0, 0, 0),
                  child: Text(
                    '품목 1',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    28 * (DeviceWidth / 375), 0, 25 * (DeviceWidth / 375), 0),
                child: Container(
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
                  padding: EdgeInsets.fromLTRB(
                      28 * (DeviceWidth / 375), 0, 9 * (DeviceWidth / 375), 0),
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
                          hint: Text(
                            '수량',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
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
                    padding:
                        EdgeInsets.fromLTRB(0, 0, 25 * (DeviceWidth / 375), 0),
                    child: Container(
                      height: 60,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                        child: InkWell(
                          onTap: () => _selectDueDate(context),
                          child: Row(children: [
                            Expanded(
                                child: Text(
                              '유통기한',
                              style: TextStyle(color: Colors.grey),
                            )),
                            Text(selectedDueDate.toString().substring(0, 10)),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    padding: EdgeInsets.all(0.0),
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => Navigator.pop(context),
                      child: Text('취소'),
                    ),
                  ),
                  ButtonTheme(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      // color: Theme.of(context).accentColor,
                      // color: Colors.lightGreen,
                      onPressed: () => print('Save'),
                      child: Text('저장'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
