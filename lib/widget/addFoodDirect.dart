import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';

class DirectInput extends StatefulWidget {
  @override
  _DirectInputState createState() => _DirectInputState();
}

class _DirectInputState extends State<DirectInput> {
  ScrollController _scrollController;

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
                    flex: 9,
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
                height: 45 * (DeviceHeight / 671),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Test,
                ),
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
          SizedBox(
            height: 420 * (DeviceHeight / 671),
            width: 315 * (DeviceWidth / 376),
            child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(30 * (DeviceWidth / 376), 0,
                          30 * (DeviceWidth / 376), 11 * (DeviceHeight / 671)),
                      controller: _scrollController,
                      child: Text('test'));
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: ButtonTheme(
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(
                          60.45 * (DeviceWidth / 361),
                          14.07 * (DeviceHeight / 671),
                          60.55 * (DeviceWidth / 361),
                          18.93 * (DeviceHeight / 671)),
                      color: Theme.of(context).buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        '취소',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: ButtonTheme(
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(
                          60.45 * (DeviceWidth / 361),
                          14.07 * (DeviceHeight / 671),
                          60.55 * (DeviceWidth / 361),
                          18.93 * (DeviceHeight / 671)),
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => print('Save'),
                      child: Text(
                        '저장',
                        style: Theme.of(context).textTheme.button,
                      ),
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

List<Widget> Test = <Widget>[
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('one'),
  ),
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('six'),
  ),
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('hundred'),
  ),
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('ten'),
  ),
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('four'),
  ),
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('seven'),
  ),
  Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Text('five'),
  ),
];

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
