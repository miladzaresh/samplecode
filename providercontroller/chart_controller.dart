/* import 'package:flutter/foundation.dart';
import 'package:meysam_app/models/chart_week_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
class ChartController extends ChangeNotifier{

  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: 2017,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),

    ),
    DeveloperSeries(
      year: 2018,
      developers: 120000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: 2019,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: 2020,
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: 2021,
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];

  late List<charts.Series<DeveloperSeries, num>> series=[];
  final int buyPrice=120000;

  checkChartData(context){
    series= [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor
      )
    ];
    notifyListeners();
  }
} */