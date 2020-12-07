import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarchart extends StatelessWidget {
  final List<double> covidCases;
  CovidBarchart({
    @required this.covidCases
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0)
        )
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text('Daily News Cases',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    rotateAngle: 35.0,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0: return 'May 24';
                        case 1: return 'May 25';
                        case 2: return 'May 26';
                        case 3: return 'May 27';
                        case 4: return 'May 28';
                        case 5: return 'May 29';
                        case 6: return 'May 30';
                        default: return '';
                      }
                    }
                  ),
                  leftTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    getTitles: (value) {
                      if (value == 0) {
                        return '0';
                      }else if (value % 3 == 0) {
                        return '${value ~/ 3 * 5}K';
                      }
                      return '';
                    }
                  ) 
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color:Colors.black12,
                    strokeWidth: 1.0,
                    dashArray: [5]
                  )
                ),
                borderData: FlBorderData(show: false),
                barGroups: covidCases
                  .asMap()
                  .map((key, value) => MapEntry(
                    key,
                    BarChartGroupData(
                      x: key, 
                      barRods: [
                        BarChartRodData(
                          y: value,    
                          colors: [
                            Colors.red
                          ]                
                        )
                      ])
                  ))
                  .values
                  .toList()
              )
            )
          )
        ],
      ),
    );
  }
}