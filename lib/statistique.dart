import 'package:flutter/material.dart';
import 'package:supercitoyen/ProjectStatisticsCards.dart';
import 'package:supercitoyen/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:supercitoyen/widgets/chartstatistique.dart';

class Statistique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      height: size.height,
      width: size.width,
      child: Column(
      children: <Widget>[
      NavBar(),
      ProjectStatisticsCards(),
      SizedBox(height:7),
      Container(
      width: size.width,
      height: 450,
      child:  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      DashBoard(),
      ],
      ), 
      ),
      ],
      ),
      ),
    );
  }  
}
