import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('채팅 목록'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.settings), onPressed: () => print('settings'))
          ],
        ),
        body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/users/photo_yg.jpeg'),
                ),
                title: Text('박예지'),
                subtitle: Text(
                  '친구야 내가 레몬으로 생선회 비린내를 없애려고 하는데 이거 버릴거면 나 주라 ㅎㅎ ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('오전 11:25'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/users/photo_si.jpeg'),
                ),
                title: Text('김세인'),
                subtitle: Text(
                  '친구야 내가 오이로 생선회 비린내를 없애려고 하는데 이거 버릴거면 나 주라',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('오전 11:20'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/users/photo_mj.jpeg'),
                ),
                title: Text('김민주'),
                subtitle: Text(
                  '인석아 밥해줘....',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('오전 11:18'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/users/photo_jh.jpeg'),
                ),
                title: Text('이정현'),
                subtitle: Text(
                  '내 모닝빵이랑 초코우유랑 혹시 바꾸지 않을래?-?',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('오전 11:12'),
              ),
            ),
          ]).toList(),
        ));
  }

  Widget _buildChatList() {
    return ListTile(
      leading: Image.asset('images/users/photo_yg.jpeg'),
      title: Text('박예지'),
      subtitle: Text('친구야....'),
      trailing: Text('오전 11:12'),
    );
  }
}
