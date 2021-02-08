import 'package:flutter/material.dart';

import '../colors.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('히스토리'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Text(
                  '오늘',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('\'김민주\'님에게 채팅을 요청했습니다.'),
                subtitle: Text('레몬 3개'),
                trailing: Text('3시간 전'),
              ),
              ListTile(
                title: Text('\'김민주\'님에게 채팅을 요청했습니다.'),
                subtitle: Text('레몬 3개'),
                trailing: Text('3시간 전'),
              ),
              ListTile(
                leading: Text(
                  '이번 주',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  '나에게 \'김민주\'님이 \'두유 2개\'에 대한 채팅을 요청했습니다.',
                ),
                trailing: Text('3시간 전'),
              ),
            ],
          )),
    );
  }
}
