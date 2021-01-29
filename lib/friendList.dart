import 'package:flutter/material.dart';

class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('친구 목록'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.settings), onPressed: () => print('settings'))
        ],
      ),
      body: Text('Friend List'),
    );
  }
}
