import 'package:flutter/material.dart';
import 'package:supercitoyen/widgets/card_tile.dart';

class ProjectStatisticsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.only(left: 15,right:15 ),
    child:Row(
    children: <Widget> [   
    CardTile(
    iconBgColor: Colors.orange,
    icon: Icons.show_chart,
    subText:'5' ,
     mainText: 'Moyenne des signalements par jours',
    ),
    SizedBox(width: 40),
    CardTile(
    iconBgColor: Color(0xff4791FF),
    icon: Icons.show_chart,
    subText:'40',
   mainText: 'Nombre des signalements par mois',
    ),
    SizedBox(width: 30),
    CardTile(
    iconBgColor: Color(0xff02BC77),
    icon:  Icons.format_list_numbered_rtl,
    subText: '5',
   mainText:'Nombre de signalements traités par jours',
    ),
    SizedBox(width: 30),
    CardTile(
    iconBgColor:
    Color(0xffFFD950),
    icon:  Icons.calculate,
    subText:'130',
    mainText: 'Nombre de signalements traités par mois',
    ),
    ],
    ),
    );
  }
}

