import 'package:flutter/material.dart';
import 'package:supercitoyen/utilisateurs.dart';
import 'statistique.dart';
import 'citoyen.dart';
import 'package:supercitoyen/signalement.dart';
import 'package:supercitoyen/widgets/listSignalement.dart';
import 'package:supercitoyen/widgets/detailSignalement.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  SyncfusionLicense.registerLicense(null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
       title: 'SuperCitoyen',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home:
        Statistique(),
       routes: {
        '/Signalement': (_) => Signalement(),
        '/Statistique': (_) => Statistique(),
        '/citoyen': (_) =>Citoyen(),
        '/utilisateurs': (_) =>Utilisateurs(),
        '/Listsignalment': (_) =>ListSignalement(),
        '/DetailSignalement': (_) =>DetailSignalement(),   
      },
    );
  }
}


