/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  factory GroupedBarChart.withSampleData() {
    return new GroupedBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<Ordinalamount, String>> _createSampleData() {
    final desktopamountData = [
      new Ordinalamount('2014', 5),
      new Ordinalamount('2015', 25),
      new Ordinalamount('2016', 100),
      new Ordinalamount('2017', 75),
    ];

    final tableamountData = [
      new Ordinalamount('2014', 25),
      new Ordinalamount('2015', 50),
      new Ordinalamount('2016', 10),
      new Ordinalamount('2017', 20),
    ];

    final mobileamountData = [
      new Ordinalamount('2014', 10),
      new Ordinalamount('2015', 15),
      new Ordinalamount('2016', 50),
      new Ordinalamount('2017', 45),
    ];

    return [
      new charts.Series<Ordinalamount, String>(
        id: 'Carbohydrates',
        domainFn: (Ordinalamount amount, _) => amount.nutrientName,
        measureFn: (Ordinalamount amount, _) => amount.amount,
        data: desktopamountData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
        fillColorFn: (_, __) =>
            charts.MaterialPalette.green.shadeDefault.darker,
      ),
      new charts.Series<Ordinalamount, String>(
        id: 'Protein',
        domainFn: (Ordinalamount amount, _) => amount.nutrientName,
        measureFn: (Ordinalamount amount, _) => amount.amount,
        data: tableamountData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
      new charts.Series<Ordinalamount, String>(
        id: 'Fats',
        domainFn: (Ordinalamount amount, _) => amount.nutrientName,
        measureFn: (Ordinalamount amount, _) => amount.amount,
        data: mobileamountData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
        fillColorFn: (_, __) =>
            charts.MaterialPalette.green.shadeDefault.lighter,
      ),
    ];
  }
}

/// Sample ordinal data type.
class Ordinalamount {
  final String nutrientName;
  final int amount;

  Ordinalamount(this.nutrientName, this.amount);
}
