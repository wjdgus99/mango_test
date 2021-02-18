import 'package:flutter/material.dart';

import '../colors.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('히스토리'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Text('오늘', style: Theme.of(context).textTheme.subtitle1),
            ),
            _buildHistoryTile(1, '민주', '레몬', 3, 12),
            _buildHistoryTile(2, '민주', '우유', 1, 30),
            ListTile(
              leading:
                  Text('이번 주', style: Theme.of(context).textTheme.subtitle1),
            ),
            _buildHistoryTile(1, '민주', '두유', 2, 82),
            _buildHistoryTile(2, '민주', '레몬', 3, 122),
          ],
        ));
  }

  Widget _buildHistoryTile(
      int type, String name, String food, int num, int min) {
    if (type == 1) {
      return ListTile(
        title: Text(
          '나에게 \'$name\'님이 \'$food $num개\'에 대한 채팅을 요청했습니다.',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: (min < 60)
            ? Text(
                '$min분 전',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Color(0xFF929292)),
              )
            : Text(
                '${min ~/ 60}시간 전',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Color(0xFF929292)),
              ),
      );
    } else if (type == 2) {
      return ListTile(
        title: Text('\'$name\'님에게 채팅을 요청했습니다.',
            style: Theme.of(context).textTheme.bodyText2),
        subtitle: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            '$food $num개',
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Color(0xFF929292)),
          ),
        ),
        trailing: (min < 60)
            ? Text(
                '$min분 전',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Color(0xFF929292)),
              )
            : Text(
                '${min ~/ 60}시간 전',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Color(0xFF929292)),
              ),
      );
    }
  }
}
