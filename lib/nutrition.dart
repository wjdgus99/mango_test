import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nutrition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 냉장고 속 영양성분 '),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  // TODO: color!
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: '일 ',
                    ),
                    Tab(
                      text: '주 ',
                    ),
                    Tab(
                      text: '월 ',
                    ),
                    Tab(
                      text: '년 ',
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                  children: <Widget>[
                    Container(child: Center(child: Text('1'))),
                    Container(child: Center(child: Text('2'))),
                    Container(child: Center(child: Text('3'))),
                    Container(child: Center(child: Text('4'))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
