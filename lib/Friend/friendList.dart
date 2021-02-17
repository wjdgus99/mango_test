import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/Friend/add/email.dart';
import 'package:mango_test/Friend/manageFriend.dart';
import 'package:mango_test/model/exampleUserList.dart';

import 'package:mango_test/model/exampleUser.dart';
import 'package:mango_test/test_model/exampleFriendList.dart';
import 'package:mango_test/test_model/exampleTestUser.dart';
import 'package:mango_test/test_model/exampleTestUserList.dart';
import 'package:mango_test/test_model/testUser.dart';
// import '../model/user.dart';

import 'package:top_sheet/top_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'add/ID.dart';
import 'add/phone.dart';
import 'editFriend.dart';

class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  TestUser user = localTestUser.loadUser();

  Widget buildManageBottomSheet(BuildContext context) {
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditFriend()));
            },
            child: ListTile(
              title: Text(
                '편집',
                style: Theme.of(context).textTheme.bodyText1,
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
                style: Theme.of(context).textTheme.bodyText1,
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

  Widget buildEditBottomSheet(BuildContext context) {
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Phone()));
            },
            child: ListTile(
              title: Text(
                '연락처로 추가',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => ID()));
            },
            child: ListTile(
              title: Text(
                '아이디로 추가',
                style: Theme.of(context).textTheme.bodyText1,
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
                      builder: (BuildContext context) => Email()));
            },
            child: ListTile(
              title: Text(
                '이메일로 추가',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),
          SizedBox(
            height: 60,
          )
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
              icon: Icon(Icons.person_add_alt),
              onPressed: () {
                showMaterialModalBottomSheet(
                    useRootNavigator: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: buildEditBottomSheet);
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showMaterialModalBottomSheet(
                    useRootNavigator: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: buildManageBottomSheet);
              })
        ],
      ),
      body: SizedBox.expand(
        child: SafeArea(
          minimum: EdgeInsets.all(0.1),
          child: SearchBar<TestUser>(
            searchBarPadding: EdgeInsets.all(10),
            placeHolder: ListView.builder(
                itemCount: user.FriendList.length,
                itemBuilder: (context, int index) {
                  return _buildFriendList(index);
                }),
            onSearch: search,
            minimumChars: 1,
            onItemFound: (TestUser food, int index) {
              return food.Name == '' ? SizedBox() : _buildFriendList(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFriendList(int index) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(user.FriendList[index].Image),
          ),
          title: Text(
            user.FriendList[index].Name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Phone()));
                    },
                  ),
                  Text('연락처로 추가')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ID()));
                    },
                  ),
                  Text('ID로 추가')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.person_add_alt),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Email()));
                    },
                  ),
                  Text('이메일로 추가')
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

Future<List<TestUser>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(Friends.length, (int index) {
    return Friends[index].Name.toLowerCase().contains(search.toLowerCase())
        ? TestUser(
            Name: Friends[index].Name,
            Image: Friends[index].Image,
          )
        : TestUser(Name: '');
  });
}
