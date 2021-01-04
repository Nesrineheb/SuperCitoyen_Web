import 'package:flutter/material.dart';
import 'package:supercitoyen/widgets/navbar.dart';
import 'widgets/tablesUser.dart';

class Citoyen extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      height: size.height,
      width: size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                   NavBar(),
                   TableUser(),
          ],
        ),
      ),
    ); 
  }

  }
