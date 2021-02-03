import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';
import 'package:mango_test/itemSelect.dart';

class ItemRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('거래 품목 등록'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              width: DeviceWidth,
              height: DeviceHeight * 80 / 812,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.grey),
                child: Text('+ 품목 추가하기'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ItemSelect()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
