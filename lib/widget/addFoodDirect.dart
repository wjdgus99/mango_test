import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';

class DirectInput extends StatefulWidget {
  @override
  _DirectInputState createState() => _DirectInputState();
}

class _DirectInputState extends State<DirectInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 29 * (DeviceWidth / 376)),
                    child: Text(
                      '품목',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: ButtonTheme(
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => Navigator.pop(context),
                      child: Text('취소'),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: ButtonTheme(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => print('Save'),
                      child: Text('저장'),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//
// final TextEditingController _nameController = TextEditingController();
//
// String dropdownValue = 'Option 1';
// DateTime selectedDueDate = DateTime.now();
//
// _selectDueDate(BuildContext context) async {
//   final DateTime picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDueDate,
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2030),
//     initialEntryMode: DatePickerEntryMode.input,
//   );
//   if (picked != null && picked != selectedDueDate)
//     setState(() {
//       selectedDueDate = picked;
//     });
// }
