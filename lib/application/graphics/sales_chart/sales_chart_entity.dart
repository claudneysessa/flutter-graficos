import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SalesChartEntity {
  final int year;
  final int sales;
  final String label;
  final charts.Color color;
  SalesChartEntity(this.year, this.sales, this.label, Color color)
      : this.color = charts.Color(
          r: color.red,
          g: color.green,
          b: color.blue,
          a: color.alpha,
        );
}
