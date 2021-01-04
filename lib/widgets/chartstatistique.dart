import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';


class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final List<ChartData> chartData = [
            ChartData('Plus de 40 ans', 10, Color(0xff020034)),
            ChartData('Entre 18 ans et 23 ans', 30,Color(0xff317AC1)),
            ChartData('Moins de 18 ans', 15,Color(0xffFF6810)),
            ChartData('Entre 23 ans et 40 ans', 45, Color(0xff0019E5))
        ];
         final List<ChartData> chartData2 = [
            ChartData('Dechet', 20, Colors.green),
            ChartData('Maintenance', 30,Color(0xff317AC1)),
            ChartData('Incendie', 45,Colors.redAccent),
            ChartData('Innondation', 5, Color(0xff0019E5))
        ];
    Size size = MediaQuery.of(context).size;
    return Container(
    width: size.width,
    height: 500,
    child:  Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Container(
    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
    child: SfCircularChart( 
    legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap,position: LegendPosition.bottom),
    series: <CircularSeries<ChartData,dynamic>>[
    PieSeries<ChartData, String>(
    dataSource: chartData2,
    dataLabelSettings: DataLabelSettings(isVisible:true),
    sortingOrder: SortingOrder.ascending,
    sortFieldValueMapper: (ChartData data, _) => data.x,
    pointColorMapper:(ChartData data,  _) => data.color,
    xValueMapper: (ChartData data, _) => data.x,
    yValueMapper: (ChartData data, _) => data.y,
    animationDuration: 5000
    )
    ],
    title: ChartTitle(
    text: 'Nombre de signalements par categorie ',
    alignment: ChartAlignment.near,
    textStyle: ChartTextStyle(
    color: Colors.blue,
    fontFamily: 'Roboto',
    fontSize: 14,
    )
    ),
    )
    ),
    Container(
    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
    child: SfCircularChart( legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap,position: LegendPosition.bottom),
    series: <CircularSeries<ChartData,dynamic>>[
    PieSeries<ChartData, String>(
    dataSource: chartData,
    dataLabelSettings: DataLabelSettings(isVisible:true),
    sortingOrder: SortingOrder.ascending,
    sortFieldValueMapper: (ChartData data, _) => data.x,
    pointColorMapper:(ChartData data,  _) => data.color,
    xValueMapper: (ChartData data, _) => data.x,
    yValueMapper: (ChartData data, _) => data.y,
    animationDuration: 5000                       
    )
    ],                      
   title: ChartTitle(
   text: 'Nombre de signalements par tranche d’âge ',
   alignment: ChartAlignment.near,
   textStyle: ChartTextStyle(
   color: Colors.blue,
   fontFamily: 'Roboto',
   fontSize: 14,
   )
   ),
   )
   ),                
  Container(
  padding: const EdgeInsets.all(20.0),
  child: SfCartesianChart(
  tooltipBehavior: TooltipBehavior(enable: true),
  primaryXAxis: CategoryAxis(),
  title: ChartTitle(
  text: 'Nombre de signalement par mois',
  alignment: ChartAlignment.far,
  textStyle: ChartTextStyle(
  color: Colors.blue,
  fontFamily: 'Roboto',
  fontSize: 14,
  )
  ),
  series: <ChartSeries>[
  LineSeries<SalesData, String>(
  enableTooltip: true, 
  dataSource: [
  SalesData('Jan', 9),
  SalesData('Feb', 8),
  SalesData('Mar', 6),
  SalesData('Apr', 5),
  SalesData('May', 7.5)                                
  ],
 xValueMapper: (SalesData sales, _) => sales.year,
 yValueMapper: (SalesData sales, _) => sales.sales,
 )
 ]
 )
 ),
 Container(
 child:_getDashedLineChart(),
 ),
 ],
 ),
 );
  }
}



 SfCartesianChart _getDashedLineChart() {
    return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(
    text:  'Nombre de signalement par mois pour chaque categorie',
    alignment: ChartAlignment.far,
    textStyle: ChartTextStyle(
      color: Colors.blue,
      fontFamily: 'Roboto',
      fontSize: 14,),),
    legend: Legend(
      overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: MajorGridLines(width: 0),
          interval: 1),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 10,
          labelFormat: '{value}',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getDashedLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
  List<LineSeries<_ChartData, num>> _getDashedLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(1, 6, 9, 15, 8),
      _ChartData(2, 6, 9, 15, 7),
      _ChartData(3, 6, 10, 14, 5),
      _ChartData(4, 6, 10, 13, 6),
      _ChartData(5, 6, 10, 13, 7),
      _ChartData(6, 6, 9, 13, 8),
      _ChartData(7, 7, 10, 14, 9),
      _ChartData(8, 7, 10, 14, 9),
      _ChartData(9, 7, 10, 14, 9),
      _ChartData(10, 7, 10, 14, 9),
      _ChartData(11, 7, 10, 14, 9),
      _ChartData(12, 7, 10, 14, 9),
      
    ];
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dashArray: <double>[15, 3, 3, 3],
          dataSource: chartData,
          xValueMapper: (_ChartData nbsignalement, _) => nbsignalement.x,
          yValueMapper: (_ChartData nbsignalement, _) => nbsignalement.y,
          width: 2,
          name: 'Incendie',
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          dashArray: <double>[15, 3, 3, 3],
          width: 2,
          name: 'Dechets',
          xValueMapper: (_ChartData nbsignalement, _) => nbsignalement.x,
          yValueMapper: (_ChartData nbsignalement, _) => nbsignalement.y2,
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          width: 2,
          dashArray: <double>[15, 3, 3, 3],
          name: 'Maintenance',
          xValueMapper: (_ChartData nbsignalement, _) => nbsignalement.x,
          yValueMapper: (_ChartData nbsignalement, _) => nbsignalement.y3,
          markerSettings: MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData,
          width: 2,
          dashArray: <double>[15, 3, 3, 3],
          name: 'Incident',
          xValueMapper: (_ChartData nbsignalement, _) => nbsignalement.x,
          yValueMapper: (_ChartData nbsignalement, _) =>nbsignalement.y4,
          markerSettings: MarkerSettings(isVisible: true)),
    ];
  }

class _ChartData {
  _ChartData(this.x, this.y, this.y2, this.y3, this.y4);
  final double x;
  final double y;
  final double y2;
  final double y3;
  final double y4;
}
class SalesData{
        SalesData(this.year, this.sales);
        final String year;
        final double sales;
    }
class ChartData {
      ChartData(this.x, this.y, [this.color]);
        final String x;
        final double y;
        final Color color;
    }




    