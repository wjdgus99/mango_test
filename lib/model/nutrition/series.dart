import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class Series {
  final String nutrient;
  final int percentage;
  final charts.Color barColor;

  Series(
      {@required this.nutrient,
      @required this.percentage,
      @required this.barColor});
}
