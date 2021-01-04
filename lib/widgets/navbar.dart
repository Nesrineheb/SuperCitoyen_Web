import 'package:flutter/material.dart';
import 'menu_item.dart';

class NavBar extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[     
        Container(
          child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
            width: 40,
            height: 40,
            child: Image.network("assets/logoapp.png", scale: .85),
            ),
            SizedBox(width: 16),
            Text("SuperCitoyen", 
               style: TextStyle(
               fontSize: 20,
               color: Colors.orange,
               fontFamily: "Roboto",
               )),
               SizedBox(width: 18), 
            MenuItem(
            title: "Statistiques",
            press: () {
              Navigator.of(context).pushNamed('/Statistique');
            }, 
            ),
            MenuItem(
            title: "Signalements",
            press: () {
              Navigator.of(context).pushNamed('/Signalement'); 
            },
            ),
            MenuItem(
            title: "Messages",
            press: () {
              Navigator.of(context).pushNamed('/citoyen');
             },
            ),
            MenuItem(
            title: "Citoyens",
            press: () {
              Navigator.of(context).pushNamed('/utilisateurs');
             },
            ),
            ]     
         )
      ),
      Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CircleAvatar(backgroundImage: NetworkImage("assets/tof citoyen.png"),),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          Text(
          'Karima',
          textAlign: TextAlign.start,
          style: TextStyle(
          color: Colors.grey,
          fontFamily: 'Roboto',
          fontSize: 14,
         // fontWeight: FontWeight.bold,
          ),        
          ),
          Text(
          'ait messoudane',
          textAlign: TextAlign.start,
          style: TextStyle(
          color: Colors.grey,
          fontFamily: 'Roboto',
          fontSize: 14,
          //fontWeight: FontWeight.bold,
          ),           
          ),    
          ],
        ),
      ],
      ),
      ),
             
  ]
  ),  
  ); 
  }
}