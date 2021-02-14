import 'package:flutter/material.dart';

class EditChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('편집'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
                child: FlatButton(
                    onPressed: () {},
                    child: Text('모두 읽기'),
                    color: Colors.grey)),
            Expanded(
                child: FlatButton(
              onPressed: () {},
              child: Text('채팅방 나가기'),
              color: Colors.grey,
            ))
          ],
        ),
      ),
    );
  }
}
