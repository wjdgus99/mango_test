import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';

import '../model/nutrition/chart.dart';
import '../model/nutrition/series.dart';

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  final List<Series> date_data = [
    Series(
      nutrient: '탄수화물',
      percentage: 48,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '단백질',
      percentage: 73,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '지방',
      percentage: 32,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '당류',
      percentage: 45,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
  ];

  final List<Series> week_data = [
    Series(
      nutrient: '탄수화물',
      percentage: 38,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '단백질',
      percentage: 63,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '지방',
      percentage: 82,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '당류',
      percentage: 15,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
  ];

  final List<Series> month_data = [
    Series(
      nutrient: '탄수화물',
      percentage: 48,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '단백질',
      percentage: 53,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '지방',
      percentage: 52,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '당류',
      percentage: 31,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
  ];

  final List<Series> year_data = [
    Series(
      nutrient: '탄수화물',
      percentage: 91,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '단백질',
      percentage: 63,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '지방',
      percentage: 82,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
    Series(
      nutrient: '당류',
      percentage: 25,
      barColor: charts.ColorUtil.fromDartColor(Orange500.withOpacity(0.5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Text(' '),
          title: Text('영양성분'),
          actions: [
            IconButton(
                icon: Icon(Icons.share), onPressed: () => print('nutrition'))
          ],
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
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TabBar(
                        // TODO: color!
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicator: BoxDecoration(
                          // TODO: color!
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
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
                  ),
                ),
                Container(
                  height: 300,
                  child: TabBarView(
                    children: <Widget>[
                      Container(child: Chart(data: date_data)),
                      Container(child: Chart(data: week_data)),
                      Container(child: Chart(data: month_data)),
                      Container(child: Chart(data: year_data)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
