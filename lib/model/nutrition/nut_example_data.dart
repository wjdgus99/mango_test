import 'package:flutter/material.dart';
import 'package:mango_test/model/nutrition/series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExampleData {
  final List<Series> date_data = [
    Series(
      nutrient: '탄수화물',
      percentage: 48,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
    ),
    Series(
      nutrient: '단백질',
      percentage: 73,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
    ),
    Series(
      nutrient: '지방',
      percentage: 32,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
    ),
    Series(
      nutrient: '당류',
      percentage: 45,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
    ),
  ];
}
