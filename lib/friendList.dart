import 'package:flutter/material.dart';

import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:mango_test/model/exampleUserList.dart';
import 'model/food.dart';

import 'package:mango_test/model/exampleUser.dart';
import 'model/user.dart';

import 'package:top_sheet/top_sheet.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  User user = localUser.loadUser();
  List<User> friendList = localUserList.loadUserList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('친구'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.person_add_alt), onPressed: () => _topSheet()),
          IconButton(
              icon: Icon(Icons.settings), onPressed: () => print('settings'))
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(user.Image),
            ),
            title: Text(user.Name),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(user.Image),
            ),
            title: Text(user.FriendList.toString()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(user.Image),
            ),
            title: Text(friendList.length.toString()),
          ),
        ),
      ]),
    );
  }

  Widget _buildFriendList() {
    return ListTile(
        leading: Image.asset(user.Image),
        title: Text(friendList.length.toString()));
  }

  Widget _topSheet() {
    TopSheet.show(
      context: context,
      child: Column(children: [
        ListTile(
          // leading: IconButton(icon: Icon(Icons.cancel)),
          title: Row(children: [
            Icon(Icons.cancel),
            Expanded(child: Center(child: Text('친구 추가')))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.qr_code_scanner),
                    onPressed: () => print('QR 코드'),
                  ),
                  Text('QR 코드')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.contact_phone),
                    onPressed: () => print('연락처로 추가'),
                  ),
                  Text('연락처로 추가')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () => print('ID로 추가'),
                  ),
                  Text('ID로 추가')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.person_add_alt),
                    onPressed: () => print('추천친구'),
                  ),
                  Text('추천친구')
                ],
              ),
            ],
          ),
        ),
      ]),
      direction: TopSheetDirection.TOP,
    );
  }
}
