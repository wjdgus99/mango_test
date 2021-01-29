import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mango_test/chatList.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/friendList.dart';
import 'package:mango_test/history.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();

  const Share({Key key}) : super(key: key);
}

class _ShareState extends State<Share> {
  bool none = false;

  TextEditingController editingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.person),
          // onPressed: () => Navigator.pushNamed(context, FRIENDLIST),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FriendList()));
          },
        ),
        title: Text('거래광장'),
        actions: [
          IconButton(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChatList()));
              }),
          IconButton(
              icon: Icon(Icons.article_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => History()));
              })
        ],
      ),
      body: none
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/logo.png'),
                    ),
                    Text(
                      '친구를 추가해서 \n거래를 시작해보세요',
                      textAlign: TextAlign.center,
                    ),
                  ]),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Container(
                    height: 55,
                    child: TextField(
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: 'Search',
                          suffix: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Grey200, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage('images/foods/paprika.png'),
                              backgroundColor: Colors.white60,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text('1시간 전'),
                                ),
                                Text(
                                  '파프리카 3개',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '유통기한 2021.12.30',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  '최대한 빨리 나눔합시당~~ ',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Row(
                                  children: [
                                    RaisedButton(
                                      color: Orange100,
                                      child: Icon(Icons.call),
                                      onPressed: () => print('call'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(color: Grey200)),
                                    ),
                                    RaisedButton(
                                      color: Theme.of(context).accentColor,
                                      child: Icon(Icons.send_rounded),
                                      onPressed: () => print('message'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(color: Grey200)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
