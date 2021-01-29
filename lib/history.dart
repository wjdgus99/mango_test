import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('거래 내역'),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Theme.of(context).accentColor,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
              tabs: <Tab>[
                Tab(
                  text: '전체 거래 내역',
                ),
                Tab(
                  text: '나의 거래 내역',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('aa')),
              Center(child: Text('bb')),
            ],
          )),
    );
  }
}
