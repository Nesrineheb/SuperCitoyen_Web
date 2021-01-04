import 'package:flutter/material.dart';
import 'package:supercitoyen/widgets/navbar.dart';
import 'package:supercitoyen/widgets/MapsSpace.dart';
import 'package:supercitoyen/widgets/listSignalement.dart';

class Signalement extends  StatelessWidget {
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
                   Row(
            children: <Widget>[
               Align(
            alignment: Alignment.bottomLeft,
            child: ListSignalement(),
            ),
             Align(
            alignment: Alignment.bottomRight,
            child: Map(),
            ),
            ],
            ),
          ],
      ),
      ),
      
    ); 
  }

  }
