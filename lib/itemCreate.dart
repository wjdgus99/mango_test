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
        padding: EdgeInsets.all(DeviceWidth * 0.05),// mj: TODO. DeviceWidth로 바꾸기
        children: <Widget>[
          showInfo(),
          Expanded(child: Container()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(DeviceWidth * 0.05),
        child: Container(
          height: 70,
          child: FlatButton(
            color: Theme.of(context).accentColor,
            child: Text('등록'),
            onPressed: (){},
          ),
        ),
      ),
    );
  }

  Widget showInfo() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(alignment: Alignment.topLeft, child: Text('제품정보')),
          showTextField(_nameTextController, '품명'),
          Row(
            children: <Widget>[
              showSelectField('수량'),
              showSelectField('카테고리'),
            ],
          ),
          Container(alignment: Alignment.topLeft, child: Text('보관방법')),
          Container(
            width: DeviceWidth, // mj: TODO. DeviceWidth
            child: CupertinoSegmentedControl(
              //padding: EdgeInsets.all(5), // mj: TODO. DeviceWidth
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
          showSelectField('구매일'),
        ],
      ),
    );
  }

  Widget showTextField(TextEditingController myController, String info){
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
          onPressed: () {},
        ),
      ),
    );
  }

  Widget showSelectField(String info){
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Text(info), // myIcon is a 48px-wide widget.
            ),
            Text('3'),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: (){},
            ),
            // Padding(
            //   padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
            //   child: Icon(Icons.arrow_drop_down), // myIcon is a 48px-wide widget.
            // ),
          ],
        ),
      ),
    );
  }
}
