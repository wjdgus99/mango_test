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
      body: Center(
        child: Text('Chat List'),
      ),
    );
  }
}
