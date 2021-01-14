import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/model/nutrition/series.dart';

class Chart extends StatelessWidget {
  final List<Series> data;

  const Chart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Series, String>> series = [
      charts.Series(
        id: 'Nutrition',
        data: data,
        domainFn: (Series series, _) => series.nutrient,
        measureFn: (Series series, _) => series.percentage,
        colorFn: (Series series, _) => series.barColor,
      ),
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: false,
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }
}
