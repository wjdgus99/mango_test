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
            title: Text('나눔 히스토리'),
            centerTitle: true,
          ),
          body: Center()),
    );
  }
}
