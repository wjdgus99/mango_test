import 'package:flutter/material.dart';

import 'app.dart';

class Refrigerator extends StatefulWidget {
  @override
  _RefrigeratorState createState() => _RefrigeratorState();
}

class _RefrigeratorState extends State<Refrigerator> {

  final List<String> entries = <String>['레몬','파프리카','오이','고추'];
  final List<int> numbers = <int>[1,1,1,1];
  final List<String> images = <String>['images/레몬_list.png','images/파프리카 이미지.png','images/bg.png','images/f1BMuugVyyM.png'];

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        contents(),
        contents(),
        contents(),
      ],
    );
  }

  Widget contents(){
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
              leading: Image.asset(
                '${images[index]}',
                width: 40,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text('${entries[index]}'),
              subtitle: Text('21.01.07', style: Theme.of(context).textTheme.subtitle2,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    onPressed:(){
                      setState(() {
                        setState(() {
                          if(numbers[index]==0){}
                          else{numbers[index]--;}
                        });
                      });
                    },
                    child: Icon(Icons.remove),
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black),
                    ),),
                  Text('${numbers[index]}'),
                  FlatButton(
                    onPressed:(){
                      setState(() {
                        numbers[index]++;
                      });
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
