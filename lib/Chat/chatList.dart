import 'package:flutter/material.dart';
import 'package:mango_test/Chat/editChatList.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'chatRoom.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool _sort = true;

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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditChatList()));
            },
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
              showMaterialModalBottomSheet(
                  useRootNavigator: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: buildBottomSheet2);
            },
            child: ListTile(
              title: Text(
                '채팅방 정렬',
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

  Widget buildBottomSheet2(BuildContext context) {
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
              //TODO: sort by time
              setState(() {
                _sort = true;
                Navigator.pop(context);
                Navigator.pop(context);
              });
            },
            child: ListTile(
              title: Text(
                '최신 채팅 순',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),
          InkWell(
            onTap: () {
              //TODO: sort by message cnt
              setState(() {
                _sort = false;
                Navigator.pop(context);
                Navigator.pop(context);
              });
            },
            child: ListTile(
              title: Text(
                '안 읽은 채팅 순',
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
          title: Text('채팅 목록'),
          centerTitle: true,
          actions: [
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
        body: _sort
            ? ListView(
                children: ListTile.divideTiles(context: context, tiles: [
                  _buildChatList(
                      'si',
                      '친구야 내가 오이로 생선회 비린내를 없애려고 하는데 이거 버릴거면 나 주라',
                      '오전 11:25',
                      1),
                  _buildChatList('mj', '인석아 밥해줘....', '오전 11:22', 0),
                  _buildChatList(
                      'jh', '내 모닝빵이랑 초코우유랑 혹시 바꾸지 않을래?-?', '오전 11:18', 1),
                  _buildChatList(
                    'yg', // user name
                    '오빠 고집피우지말고 안먹는 과일 나 줘.. 나 다이어트중이란말이야!!', //body content
                    '오전 11:12', //time
                    3, // unread message
                  ),
                ]).toList(),
              )
            : ListView(
                children: ListTile.divideTiles(context: context, tiles: [
                  _buildChatList(
                    'yg', // user name
                    '오빠 고집피우지말고 안먹는 과일 나 줘.. 나 다이어트중이란말이야!!', //body content
                    '오전 11:22', //time
                    3, // unread message
                  ),
                  _buildChatList(
                      'si',
                      '친구야 내가 오이로 생선회 비린내를 없애려고 하는데 이거 버릴거면 나 주라',
                      '오전 11:18',
                      1),
                  _buildChatList(
                      'jh', '내 모닝빵이랑 초코우유랑 혹시 바꾸지 않을래?-?', '오전 11:12', 1),
                  _buildChatList('mj', '인석아 밥해줘....', '오전 11:25', 0),
                ]).toList(),
              ));
  }

  Widget _buildChatList(String user, String text, String time, int message) {
    return InkWell(
      onTap: () {
        print(Navigator.defaultRouteName);

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => ChatRoom()));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          // isThreeLine: true,
          contentPadding: EdgeInsets.all(2),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('images/users/photo_$user.jpeg'),
          ),
          title: Text(user),
          subtitle: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Text(time),
              if (message != 0)
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Text(
                    message.toString(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
