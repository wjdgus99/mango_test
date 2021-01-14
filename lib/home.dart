import 'package:mango_test/app.dart';
import 'package:mango_test/widget/appBar.dart';
import 'package:mango_test/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final List<String> entries = <String>['레몬','파프리카','오이','고추'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('나의 냉장고'),
      body: ListView.separated(
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
      ),
      bottomNavigationBar: bottomNavigationBar(context),
      floatingActionButton: FAB(context),
      floatingActionButtonLocation: FABLocation,
    );
  }



}
