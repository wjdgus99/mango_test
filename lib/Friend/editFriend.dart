import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/Friend/friendList.dart';
import 'package:mango_test/test_model/exampleTestUser.dart';
import 'package:mango_test/test_model/testUser.dart';
import 'package:mango_test/test_model/exampleFriendList.dart';

class EditFriend extends StatefulWidget {
  @override
  _EditFriendState createState() => _EditFriendState();
}

class _EditFriendState extends State<EditFriend> {
  TestUser user = localTestUser.loadUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Center(child: Text('완료'))),
        title: Text('친구 편집'),
        centerTitle: true,
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
      // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(user.FriendList[index].Image),
          ),
          title: Text(user.FriendList[index].Name),
          trailing: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ButtonTheme.fromButtonThemeData(
              data: Theme.of(context).buttonTheme.copyWith(
                    minWidth: 70,
                  ),
              child: FlatButton(
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () => print('hide from freind list'),
                child: Text('숨김'),
              ),
            ),
          ),
        ),
      ),
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
