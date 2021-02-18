import 'package:flutter/material.dart';

class ManageFriend extends StatefulWidget {
  @override
  _ManageFriendState createState() => _ManageFriendState();
}

class _ManageFriendState extends State<ManageFriend> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text('친구 관리'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('자동 친구 추가'),
            ),
            trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                }),
            subtitle: Text(
                '내 연락처에서 MANGO 앱을 사용하는 친구들을 자동으로 친구목록에 추가합니다. 등록 가능한 친구 수가 최대 친구 수를 초과할 경우에는 추가되지 않습니다.'),
          ),
          Divider(thickness: 0.5),
          ListTile(
            title: Text('친구 목록 새로고침'),
          ),
          Divider(thickness: 0.5),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('친구 관리'),
          ),
          ListTile(
            title: Text('숨김 친구 관리'),
          ),
          Divider(thickness: 0.5),
          ListTile(
            title: Text('차단 친구 관리'),
          ),
          Divider(thickness: 0.5),
        ],
      ),
    );
  }
}
