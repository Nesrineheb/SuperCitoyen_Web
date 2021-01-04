import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter/widgets.dart';

class Model { //la classe qui represente l'info du signalement a afficher 
  const Model({this.place, this.latitude, this.longitude,this.categorie});
  final String categorie; 
  final String place;  //adresse
  final double latitude;
  final double longitude;
}

class Map extends StatefulWidget {//la classe qui affiche la map
  @override
  _Map createState() => _Map();
}
class _Map extends State<Map> {
  MapZoomPanBehavior _zoomPanBehavior;
  List _data; //la liste des signalement et les proprites qu'il faut afficher
  @override
  void initState() {
  _zoomPanBehavior = MapZoomPanBehavior();
  
   _data = const [
  Model(
  place:'Alger',  
  latitude: 36.7691,
  longitude:3.0618,
  categorie:'dechet'
  ),
  Model(
  place:'Blida',
  latitude: 36.4669,
  longitude:2.9433,
  categorie:'maintenance'
  ),
  Model(
  place:'Bejaia',
  latitude: 36.699,
  longitude:5.065,
  categorie:'dechet'
  ),
  Model(
  place:'Annaba',
  latitude: 36.828,
  longitude:7.797,
  categorie:'maintenance'
  ),
  Model(
  place:'Oran',
  latitude: 35.671,
  longitude:-0.609,
  categorie:'dechet'
  ),
  ];
  super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
  return Align(
  alignment: Alignment.bottomRight,
  child: Container(
  padding: EdgeInsets.only(right: 7, left: 7, top: 7,bottom: 10),
  height:MediaQuery.of(context).size.height-120,
  width: MediaQuery.of(context).size.width*0.43 ,   
  child:Stack(
  alignment: AlignmentDirectional.topStart,
  children: [
  Container(
  padding: EdgeInsets.only(right: 7, left: 7, top: 7,bottom: 27 ),
  height:MediaQuery.of(context).size.height-120,
  width: MediaQuery.of(context).size.width*0.43 ,  
  child:SfMaps( 
  layers: [
  MapTileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  initialZoomLevel: 10,
  initialFocalLatLng: MapLatLng( 36.7691, 3.0618), //localisation a afficher lors de l'ouverture de la map
  zoomPanBehavior: _zoomPanBehavior,
  initialMarkersCount: 5, //_data.length(la taille de la table des signalements),
  markerBuilder: (BuildContext context, int index) {
  return MapMarker(
  latitude: _data[index].latitude,
  longitude: _data[index].longitude,
  child: const Icon(
  Icons.location_on,
  size: 30,
  color: Colors.redAccent,
                  ),
                 );
  },
  markerTooltipBuilder: (BuildContext context, int index) { //le container qui s'affiche lors du hover sur l'icon place sur la map
  return Container( 
  width: 150,
  padding: const EdgeInsets.all(10),
  child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
  Stack(
  children: [
  Center(
  child: Text(
   _data[index].place,
  style: TextStyle(
  color: Colors.white,
  fontSize: Theme.of(context)
          .textTheme
          .bodyText2
          .fontSize),
              ),
       ),
  const Icon(
  Icons.tour,
  color: Colors.white,
  size: 14,
  ),
  ],
  ),
  const Divider(
  color: Colors.white,
  height: 10,
  thickness: 1.2,
  ),
  Text(
  _data[index].categorie,
  style: TextStyle(
  color: Colors.white,
  fontSize:
  Theme.of(context).textTheme.bodyText2.fontSize),
      ),
  ],
  ),
  );
  },
  tooltipSettings: const MapTooltipSettings(
  color: Color(0xff317AC1),
  strokeColor: Colors.white,
  strokeWidth: 1 
  ),
  ),
  ],
  ),
  ),
  Row(
  children: [ //la barre du recherche
  Align(
  alignment: Alignment.topLeft,
  child: Container(
  padding: EdgeInsets.only(right: 20, left: 10, top: 20),
  width: 250,
  height: 60,
  child: TextField(
  style: TextStyle(color: Color(0xff4A4A4B)),
  decoration: InputDecoration(
  contentPadding: EdgeInsets.only(
  left: 10, right: 3, top: 3, bottom: 3),
  enabledBorder: const OutlineInputBorder(
  borderSide: const BorderSide(color: Color(0xff707070),width:1.5),
  ),
  focusedBorder: const OutlineInputBorder(
  borderSide: const BorderSide(color: Color(0xff4A4A4B)),
  ),
  hintText: 'Rechercher',
  hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
  suffixIcon: IconButton(
  icon: Icon(
  Icons.my_location,
  color: Color(0xff317AC1),
  size: 18,
  ),
  tooltip: 'Ma location',
  onPressed: () async {
      //le code de la recherche              
   },
   )
   ),
   ),
  ),
  ),
  ],
  ),
   ],),
  ),
  );
 }
}


  


