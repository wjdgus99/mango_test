import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';

class ItemCreate extends StatefulWidget {
  @override
  _ItemCreateState createState() => _ItemCreateState();
}

class _ItemCreateState extends State<ItemCreate> {
  String appTitle = '냉장고 품목 수정';
  int tabValue = 0;
  int radioValue = 0;
  final TextEditingController _nameTextController = new TextEditingController();

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
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: ListView(
        children: <Widget>[
          showInfo(),
        ],
      ),
    );
  }

  Widget showInfo() {
    return Container(
      padding: EdgeInsets.all(20), // mj: TODO. DeviceWidth로 바꾸기
      child: Column(
        children: <Widget>[
          Container(alignment: Alignment.topLeft, child: Text('제품정보')),
          TextFormField(
            controller: _nameTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon:  Text('품명'),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              ),
            ),
          ),
          Row(
            children: <Widget>[],
          ),
          Container(alignment: Alignment.topLeft, child: Text('보관방법')),
          Container(
            width: 500, // mj: TODO. DeviceWidth
            child: CupertinoSegmentedControl(
              padding: EdgeInsets.all(10),
              children: tabBarWidget,
              onValueChanged: (int val) {
                setState(() {
                  tabValue = val;
                });
              },
              groupValue: tabValue,
            ),
          ),
          Row(
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
          TextField(),
        ],
      ),
    );
  }
}
