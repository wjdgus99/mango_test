import 'package:flutter/material.dart';

import 'app.dart';

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();
}

class _RefrigeratorState extends State<Refrigerator> {

  final List<String> entries = <String>['레몬','파프리카','오이','고추'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(DeviceWidth * 0.05),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 85,
          decoration: BoxDecoration(
            color: Color(0xFFF9F8F6),
            border: Border.all(
              color: Color(0xFFF9F8F6),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Center(
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text('${entries[index]}'),
              subtitle: Text('21.01.07'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    onPressed:(){
                    },
                    child: Icon(Icons.remove),
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),),
                  Text('1'),
                  FlatButton(
                    onPressed:(){
                    },
                    child: Icon(Icons.add),
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
    );
  }
}
