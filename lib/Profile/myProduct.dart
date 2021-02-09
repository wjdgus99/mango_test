import 'package:flutter/material.dart';

import '../colors.dart';

class MyProduct extends StatefulWidget {
  @override
  _MyProductState createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 거래 글'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('2021.01.18'),
          ),
          buildCard('paprika', 'jh', '파프리카 으웩', 30, true),
          buildCard('바나나', 'jh', '덜익은 바나나 먹을사람~', 120, false),
        ],
      ),
    );
  }

  Widget buildCard(
      String food, String user, String text, int min, bool shared) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('images/foods/$food.png'),
                      backgroundColor: Colors.grey[200],
                    ),
                    Positioned(
                      left: 50,
                      top: 50,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('images/users/photo_$user.jpeg'),
                        backgroundColor: Colors.white60,
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child:
                        (min < 60) ? Text('$min분 전') : Text('${min ~/ 60}시간 전'),
                  ),
                  Text(
                    food + '  3개',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '유통기한 2021.12.30',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Red500),
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          shared ? '거래 완료' : '',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
