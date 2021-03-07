import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../app.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<String> _list2 = ['5분 전', '10분 전', '15분 전', '30분 전', '1시간 전', '2시간 전'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래 약속 잡기'),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                print('save');
                Navigator.pop(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Text(
                      '저장',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '약속 시간',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            showSelectField(1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '약속 시간을 설정하면 친구와의 만남에 대한 약속을 확실히 할 수 있어요!',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: Color(0xFFBFBFBF)),
              ),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: [
                Expanded(
                  child: Text(
                    '알림 설정',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    }),
              ]),
            ),
            showSelectField(2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '약속 시간을 설정하면 친구와의 만남에 대한 약속을 확실히 할 수 있어요!',
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: Color(0xFFBFBFBF)),
              ),
            ),
            Divider(thickness: 1),
          ],
        ),
      ),
    );
  }

  bool isSwitched = true;
  DateTime date = DateTime.now();
  String time = '시간 설정';

  Widget showSelectField(int type) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: type == 1 ? Text('약속 시간') : Text('알림 시간'),
              ),
              type == 1
                  ? Text(date.year.toString() +
                      '-' +
                      date.month.toString() +
                      '-' +
                      date.day.toString())
                  : Text(time),
              Expanded(child: SizedBox()),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  type == 1 ? showDatePicker() : showTimePicker(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDatePicker() {
    return DatePicker.showDatePicker(context,
        showTitleActions: true,
        locale: LocaleType.ko,
        currentTime: DateTime.now(), onConfirm: (_date) {
      setState(() {
        date = _date;
      });
    });
  }

  Future<dynamic> showTimePicker(int index) {
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
                    '시간',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    onSelectedItemChanged: (int newValue) {
                      setState(() {
                        time = _list2[newValue];
                      });
                    },
                    children: List<Widget>.generate(5, (int index) {
                      return Text(
                        _list2[index++],
                      );
                    }),
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
