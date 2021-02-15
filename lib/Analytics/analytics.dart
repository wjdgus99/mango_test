import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';
import 'package:spider_chart/spider_chart.dart';

import '../colors.dart';

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Orange500,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.line_weight),
          ),
          title: Text('냉장고 분석'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.crop_square), onPressed: () => print('ref'))
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('나의 영양 정보'),
                    ),
                    Container(
                      child: SpiderChart(

                        data: [42, 50, 71, 80, 55],
                        maxValue: 100,
                        colors: <Color>[
                          TGreen500,
                          TGreen500,
                          TGreen500,
                          TGreen500,
                          TGreen500,
                        ],
                      ),
                      width: 300,
                      height: 250,
                    )
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
