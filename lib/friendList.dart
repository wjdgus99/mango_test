import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/manageFriend.dart';
import 'package:mango_test/model/exampleUserList.dart';

import 'package:mango_test/model/exampleUser.dart';
import 'model/user.dart';

import 'package:top_sheet/top_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  User user = localUser.loadUser();
  List<User> friendList = localUserList.loadUserList();

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(children: [
            Expanded(
                child: Divider(
              indent: 180,
              endIndent: 135,
              thickness: 4,
            )),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ]),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                '편집',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ManageFriend()));
            },
            child: ListTile(
              title: Text(
                '친구 관리',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // ListTile(
          //   title: Text('전체 설정'),
          // ),
        ],
      ),
    );
  }

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
              icon: Icon(Icons.settings),
              onPressed: () {
                showMaterialModalBottomSheet(
                    useRootNavigator: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: buildBottomSheet);
              })
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
