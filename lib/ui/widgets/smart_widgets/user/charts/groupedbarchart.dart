/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:knowyourplate/model/record.dart';

class GroupedBarChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate});

  factory GroupedBarChart.withSampleData(List<Record> recordlist) {
    return new GroupedBarChart(
      _createSampleData(recordlist),
      animate: false,
    );
  }

  @override
  _GroupedBarChartState createState() => _GroupedBarChartState();

  /// Create series list with multiple series
  static List<charts.Series<Ordinalamount, String>> _createSampleData(
      List<Record> recordlist) {
    List<Ordinalamount> dayOne = [];
    List<Ordinalamount> dayTwo = [];
    List<Ordinalamount> dayThree = [];

    int count = 0;
    if (recordlist.length == 1) {
      while (count != recordlist.length) {
        if (count == 0) {
          dayOne
              .add(new Ordinalamount('carbs', recordlist[count].carbs.toInt()));
          dayOne.add(
              new Ordinalamount('protein', recordlist[count].protein.toInt()));
          dayOne.add(new Ordinalamount('fats', recordlist[count].fats.toInt()));
        }
        count += 1;
      }
      return [
        new charts.Series<Ordinalamount, String>(
          id: 'Day 1',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayOne,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker,
        ),
      ];
    } else if (recordlist.length == 2) {
      while (count != recordlist.length) {
        if (count == 0) {
          dayOne
              .add(new Ordinalamount('carbs', recordlist[count].carbs.toInt()));
          dayOne.add(
              new Ordinalamount('protein', recordlist[count].protein.toInt()));
          dayOne.add(new Ordinalamount('fats', recordlist[count].fats.toInt()));
        }
        if (count == 1) {
          dayTwo
              .add(new Ordinalamount('carbs', recordlist[count].carbs.toInt()));
          dayTwo.add(
              new Ordinalamount('protein', recordlist[count].protein.toInt()));
          dayTwo.add(new Ordinalamount('fats', recordlist[count].fats.toInt()));
        }

        count += 1;
      }
      return [
        new charts.Series<Ordinalamount, String>(
          id: 'Day 1',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayOne,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker,
        ),
        new charts.Series<Ordinalamount, String>(
          id: 'Day 2',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayTwo,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        )
      ];
    } else {
      while (count != 3) {
        if (count == 0) {
          dayOne
              .add(new Ordinalamount('carbs', recordlist[count].carbs.toInt()));
          dayOne.add(
              new Ordinalamount('protein', recordlist[count].protein.toInt()));
          dayOne.add(new Ordinalamount('fats', recordlist[count].fats.toInt()));
        } else if (count == 1) {
          dayTwo
              .add(new Ordinalamount('carbs', recordlist[count].carbs.toInt()));
          dayTwo.add(
              new Ordinalamount('protein', recordlist[count].protein.toInt()));
          dayTwo.add(new Ordinalamount('fats', recordlist[count].fats.toInt()));
        } else if (count == 2) {
          dayThree
              .add(new Ordinalamount('carbs', recordlist[count].carbs.toInt()));
          dayThree.add(
              new Ordinalamount('protein', recordlist[count].protein.toInt()));
          dayThree
              .add(new Ordinalamount('fats', recordlist[count].fats.toInt()));
        }

        count += 1;
      }

      return [
        new charts.Series<Ordinalamount, String>(
          id: 'Day 1',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayOne,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker,
        ),
        new charts.Series<Ordinalamount, String>(
          id: 'Day 2',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayTwo,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        ),
        new charts.Series<Ordinalamount, String>(
          id: 'Day 3',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayThree,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.lighter,
        ),
      ];
    }
  }
}

class _GroupedBarChartState extends State<GroupedBarChart> {
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      widget.seriesList,
      animate: widget.animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }
}

/// Sample ordinal data type.
class Ordinalamount {
  final String nutrientName;
  final int amount;

  Ordinalamount(this.nutrientName, this.amount);
}
