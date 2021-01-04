import 'package:flutter/material.dart';
import 'dart:math';
import 'package:supercitoyen/widgets/page_header.dart';
import 'package:responsive_table/ResponsiveDatatable.dart';
import 'package:responsive_table/responsive_table.dart';

class TableInfoUser extends StatefulWidget {

  @override
  Body createState() => Body();
  }
class Body extends State<TableInfoUser > {
  List<Map<String, dynamic>> _source = List<Map<String, dynamic>>();
  bool _isLoading =true;
  List<Map<String, dynamic>> _generateData({int n: 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _source.length;
    print(i);
    for (var data in source) {
      temps.add({
        "id": i,
        "Num": "066698765$i",
        "nom": "Karima ait messoudane $i",
        "adrs": "Cité 250 lgt, Douera Alger",
        "nbsignalement":"10"+"$i",
      });
      i++;
    }
    return temps;
  }


  _initData() async {
    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 2)).then((value) {
      _source.addAll(_generateData(n: 1000));
      setState(() => _isLoading = false);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
 List<DatatableHeader> _headers = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
       // flex: 10,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
       text: "Nom du citoyen",
        value: "nom",
        show: true,
        sortable: true,
        sourceBuilder: (value, row) {
        return Container(
                padding: EdgeInsets.only(left:1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                     // backgroundColor: Colors.blue,
                      backgroundImage: NetworkImage("assets/tof citoyen.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text( value),
                        
                      ],
                    ),
                  ],
                ),
              );
              },
               textAlign: TextAlign.left),
       
    DatatableHeader(
        text: "Numero de telephone",
        value: "Num",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Adresse",
        value: "adrs",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
         DatatableHeader(
        text: "Nombre de signalement totale",
        value: "nbsignalement",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),  
  ];


    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(
                  maxHeight: 600,
                ),
                child: Card(
                  elevation: 1,
                //  shadowColor: Colors.black,
                  clipBehavior: Clip.none,
                  child: ResponsiveDatatable(      
              actions: [
                 Container(
                      child: Row(
                         children: [
                          PageHeader(text: 'Utilisateurs',),
                          SizedBox(width: 45,),
                       Container(
                         margin: EdgeInsets.all(5),
                         padding: EdgeInsets.all(0),// mainAxisAlignment: MainAxisAlignment.start,
                         height: 30,
                         width: 300,
                            child: TextField(
                              textAlign: TextAlign.center,
                              autofocus: true,
                              decoration: InputDecoration(
                                 contentPadding: EdgeInsets.only(
                            left: 10, right: 3, top: 3, bottom: 3),
                              hintText: "Rechercher",
                             hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
                             enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color:Color(0xff317AC1))),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide( color: Color(0xff317AC1)),
                              ),
                                      suffixIcon: IconButton(
                                      icon: Icon(Icons.search,color: Color(0xff317AC1),size: 18,), 
                                      alignment: AlignmentDirectional.centerEnd,
                                      onPressed: () {})
                                      
                                      ),
                         )
                            ),
                    ],
                      ),
                     ),
                 
                    ],
                    headers: _headers,
                    source: _source,
                    autoHeight: false,
                    onTabRow: (data) {
                      print(data);
                    },
                  ),
                ),
              ),
            ]
        )
    );
  }  }
