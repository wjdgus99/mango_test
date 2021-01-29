import 'package:flutter/material.dart';

import 'model/user.dart';
import 'model/exampleUserList.dart';

class mjTest extends StatefulWidget {
  @override
  _mjTestState createState() => _mjTestState();
}

class _mjTestState extends State<mjTest> {
  List<User> Users = localUserList.loadUserList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mj')),
      body: ListView.separated(
        itemCount: Users.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Text('${Users[index].Name}'),
              Image.asset('${Users[index].Image}'),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
