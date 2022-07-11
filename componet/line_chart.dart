import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      data,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get data => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 7,
        maxY: 4,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '500,000';
              case 2:
                return '1250,000';
              case 3:
                return '300,000';
              case 4:
                return '925,000';
            }
            return '';
          },
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        lineChartBarData_1,
        lineChartBarData_2,
      ];

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: false,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        getTitles: (value) {
          return value.round().toString();
        },
      );

  FlGridData get gridData => FlGridData(show: true, drawHorizontalLine: false, horizontalInterval: 5.2);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData_1 => LineChartBarData(
        isCurved: true,
        colors: [Colors.blueGrey.shade100],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(2, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 2.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData_2 => LineChartBarData(
        isCurved: true,
        colors: [Colors.black],
        barWidth: 2,
        isStrokeCapRound: false,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false, colors: [
          Colors.grey,
        ]),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );
}

class MyLineChart extends StatefulWidget {
  const MyLineChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyLineChartState();
}

class MyLineChartState extends State<MyLineChart> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            /*  gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 235, 235, 235),
              Color(0xffeeeeee),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ), */
            color: Color(0xffeeeeee)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                'امروز 1,500,000',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'دیروز 1,310,000',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: _LineChart(isShowingMainData: isShowingMainData),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
