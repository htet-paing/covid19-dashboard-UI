import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard('Total Cases', '1.81 M', Colors.orange),
                _buildStatCard('Deaths', '105 K', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatCard('Recoverd', '391 K', Colors.green),
                _buildStatCard('Actives', '1.31 M', Colors.lightBlue),
                _buildStatCard('Critical', 'N/A', Colors.purple),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600
            ),),
            Text(count, style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ))
          ],
        ),
      ),
    );
  }
}