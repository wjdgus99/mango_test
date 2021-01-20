import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';

class AdditionalInput extends StatefulWidget {
  final String filePath;

  const AdditionalInput({Key key, this.filePath}) : super(key: key);

  @override
  _AdditionalInputState createState() =>
      _AdditionalInputState(imagePath: filePath);
}

class _AdditionalInputState extends State<AdditionalInput> {
  final String imagePath;

  _AdditionalInputState({
    Key key,
    @required this.imagePath,
  }) : super();

  final TextEditingController _nameController = TextEditingController();

  String dropdownValue = 'Option 1';
  DateTime selectedDueDate = DateTime.now();
  var imagesrc;

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Image.network(imagePath),
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
                    onPressed: () {
                      Navigator.pushNamed(context, CAMERA);
                    },
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
          // Image.network(
          //     'gs://mangotest-68540.appspot.com/01234/2021-01-20 18:14:24.732171.png'),
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
