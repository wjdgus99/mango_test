import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';

import 'app.dart';

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

  Widget addProduct() {
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
    );
  }


  @override
  Widget build(BuildContext context) {
    // var productList = List<Widget>();

    // Column productColumn 선언 후 children에 할당...
    //productColumn.children.add(Column)

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
                onPressed: addProduct,
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
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
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
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
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
  }
}
