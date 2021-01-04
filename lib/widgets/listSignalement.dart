
import 'package:flutter/material.dart';
import 'package:supercitoyen/widgets/chartstatistique.dart';
import 'package:supercitoyen/widgets/navbar.dart';

import 'package:supercitoyen/widgets/detailSignalement.dart';
class ListSignalement extends StatefulWidget {
  @override
  _ListSignalement createState() => _ListSignalement();
}

class _ListSignalement extends State<ListSignalement> {
  List<int> top = [];
  List<int> bottom = [0];
  @override
  Widget build(BuildContext context) {
  return Container (
  padding: EdgeInsets.all(7),
  width: MediaQuery.of(context).size.width*0.55,
  height:MediaQuery.of(context).size.height-120,
  child: Column(      
        children: [ 
          Container(
                 padding: EdgeInsets.only(left: 7,right:7 ),
                 height:40,
                 child: Row(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                  Container(
                  margin: EdgeInsets.only(right: 10), 
                  child:Text('List des signalements', 
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  ),
                  ),
                  ),
                Spacer(),
                Container(
                child:Align(     
                alignment: Alignment.topLeft, 
                child:RaisedButton.icon(
                  onPressed: (){ print('Button Clicked.'); },
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  label: Text('Filtrer',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  ),
                  ), 
                  icon: Icon(Icons.filter_rounded,
                  color:Colors.white,), 
                  textColor: Colors.white,
                  splashColor: Colors.blue,
                  color: Color(0xff317AC1),),
                  ),
                  ),
                SizedBox(width:10),
                Container(
                child:Align(
                alignment: Alignment.topRight, 
                child:RaisedButton.icon(
                  onPressed: (){ 
                    //le code de la methode qui afficher les criteres d'ordonnancement
                   },
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
                label: Text('Ordonner', 
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 12,
                ),
                ),
                icon: Icon(Icons.sort, color:Colors.white,), 
                textColor: Colors.white,
                splashColor: Colors.blue,
                color: Color(0xff317AC1),),
                ),
                ), 
              ],
              ),
              ),
          Container(
          padding: EdgeInsets.all(7),
          width: MediaQuery.of(context).size.width*0.55,
          height:MediaQuery.of(context).size.height*0.75,
          //Affichier la liste des signalements
          child: CustomScrollView(
          slivers: <Widget>[
          SliverList(
          delegate: SliverChildBuilderDelegate(
          (BuildContext context, int i) {
          return 
          Container(
          height: 110 ,
          width: 250,  
          child:InkWell(
          onTap:  () {
             Navigator.of(context).pushNamed('/DetailSignalement');
            }, 
          child:Container(
          width: 250, 
          height: 110 ,
          margin: EdgeInsets.only(bottom: 20),
          color: Color(0xffEBEBEB),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
          Container( 
          child:Column(
          children: [
          //Titre du signalement
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(width:3),
            Text(
            '#10 Déchets : ',
            style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20,
            ),
            ),
            Text(
            ' Nous avons besoin de poubelles en plus',
            style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto',
            fontSize: 15,
            ),
            ),
          SizedBox(width:8),
          //Etat du signalement
            Text(
            'Fermé',
            style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 15,
            ),
            ),
            ],
            ),
          SizedBox(height: 10),
          //Lieu du signalement
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(width:20),
            Text(
            'Lieu : ',
            style: TextStyle(
            color: Color.fromRGBO(34, 43, 69, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 15,
            ),
            ),
            Text(
            'Cité 250 lgt, Douera Alger',
            style: TextStyle(
            color: Color.fromRGBO(34, 43, 69, 1).withOpacity(0.8),
            fontFamily: 'Roboto',
            fontSize: 15,
            ),
            ),
            ],
            ),
          SizedBox(height: 10),
          //Date du signalement
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            SizedBox(width:20),
            Text(
            'Date envoie : ',
            style: TextStyle(
            color: Color.fromRGBO(34, 43, 69, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 15,
            ),
            ),
            Text(
           '11/12/2020',
            style: TextStyle(
            color: Color.fromRGBO(34, 43, 69, 1).withOpacity(0.8),
            fontFamily: 'Roboto',
            fontSize: 15,
            ),
            ),
            ],
            ),

          ],
          )
          ),
          Spacer(),
          //photo du signalement
          Container(
          height: 70,
          width: 130,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          image: DecorationImage(
          image: NetworkImage(
            'https://www.algerie-eco.com/wp-content/uploads/2016/04/Dechets-Decharge.jpg',
                             ),
          fit: BoxFit.cover,
          ),
          ),
         child: Container(
         decoration: BoxDecoration(
         border: Border.all(color: Colors.black)
         ),
         ),
         ), 
         ], 
         ),
         ),
         ),
         );
        },
        childCount: 15,  //le nombre c'est la taille de la table signalement
        ),
        ),
        ],
        ),
        ),],
        ),
    );
  }
}
 
  