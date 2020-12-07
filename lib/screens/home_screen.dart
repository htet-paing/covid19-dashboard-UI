import 'package:covid19_dashboard_ui/config/palette.dart';
import 'package:covid19_dashboard_ui/config/styles.dart';
import 'package:covid19_dashboard_ui/data/data.dart';
import 'package:covid19_dashboard_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'USA';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTasks(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return  SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('COVID-19',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold
                 ),),
                 CountryDropdown(
                   countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                   country: _country,
                   onChanged: (val) => setState(() => _country= val),
                 ),
               ],
             ),
             SizedBox(height: screenHeight * 0.03),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you feel sick with any COVID-19 symptoms, please call or text us immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      onPressed: (){},
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      icon: Icon(Icons.phone,
                        color: Colors.white,),
                      label: Text('Call Now',
                      style: Styles.buttonTextStyle),
                      textColor: Colors.white
                    ),
                    FlatButton.icon(
                      padding: EdgeInsets.symmetric(vertical: 10.0,
                      horizontal: 20.0),
                      onPressed: (){},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      icon: Icon(Icons.phone,
                        color: Colors.white,),
                      label: Text('Send SMS',
                      style: Styles.buttonTextStyle),
                      textColor: Colors.white
                    )
                  ],
                )
               ],
             )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prevention Tips',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention.map((e) => 
              Column(
                children: [
                  Image.asset(e.keys.first,
                    height: screenHeight * 0.12
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    e.values.first,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
  
  SliverToBoxAdapter _buildYourOwnTasks(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        height: screenHeight * 0.15,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor]
          ),
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Do your own test!',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: screenHeight * 0.01,),
                Text('Follow the instruction\nto do your own task.',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,               
                )),
              ],
            )
          ],
        ),
      ),
    );
    
  }
}