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
  bool _isEdited = false;

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
  ];

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
              Navigator.pop(context);
              setState(() {
                _isEdited = true;
              });
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => EditChatList()));
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
        appBar: _isEdited
            ? AppBar(
                title: Text('편집'),
                centerTitle: true,
                leading: TextButton(
                  onPressed: () {
                    setState(() {
                      _isEdited = false;
                      for(int i= 0; i<isSelected.length; i++){setState(() {
                        isSelected[i] = false;
                      });}
                    });
                  },
                  child: Text(
                    '완료',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isEdited = false;
                        for(int i= 0; i<isSelected.length; i++){setState(() {
                          isSelected[i] = false;
                        });}
                      });
                    },
                    child: Text('취소',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Color(0xFF929292))),
                  ),
                ],
              )
            : AppBar(
                title: Text('채팅'),
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
                      0,
                      'si',
                      '친구야 내가 오이로 생선회 비린내를 없애려고 하는데 이거 버릴거면 나 주라',
                      '오전 11:25',
                      1),
                  _buildChatList(1, 'mj', '인석아 밥해줘....', '오전 11:22', 0),
                  _buildChatList(
                      2, 'jh', '내 모닝빵이랑 초코우유랑 혹시 바꾸지 않을래?-?', '오전 11:18', 1),
                  _buildChatList(
                    3,
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
                    3,
                    'yg', // user name
                    '오빠 고집피우지말고 안먹는 과일 나 줘.. 나 다이어트중이란말이야!!', //body content
                    '오전 11:22', //time
                    3, // unread message
                  ),
                  _buildChatList(
                      0,
                      'si',
                      '친구야 내가 오이로 생선회 비린내를 없애려고 하는데 이거 버릴거면 나 주라',
                      '오전 11:18',
                      1),
                  _buildChatList(
                      2, 'jh', '내 모닝빵이랑 초코우유랑 혹시 바꾸지 않을래?-?', '오전 11:12', 1),
                  _buildChatList(1, 'mj', '인석아 밥해줘....', '오전 11:25', 0),
                ]).toList(),
              ));
  }

  Widget _buildChatList(
      int index, String user, String text, String time, int message) {
    return InkWell(
      onTap: () {
        print(Navigator.defaultRouteName);

        _isEdited
            ? null
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ChatRoom()));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              // isThreeLine: true,
              contentPadding: EdgeInsets.all(2),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('images/users/photo_$user.jpeg'),
              ),
              title: Text(
                user,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                children: [
                  Text(
                    time,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Color(0xFFBFBFBF)),
                  ),
                  if (message != 0)
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Text(
                          message.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Color(0xFFBFBFBF)),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          _isEdited
              ? Positioned(
                  top: -5,
                  left: 5,
                  child: SizedBox(
                    width: 18,
                    child: Stack(
                      children: [
                        RaisedButton(
                          shape: CircleBorder(),
                          color: isSelected[index]
                              ? Theme.of(context).accentColor
                              : Color(0xFF666666).withOpacity(0.4),
                          onPressed: () {
                            setState(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
