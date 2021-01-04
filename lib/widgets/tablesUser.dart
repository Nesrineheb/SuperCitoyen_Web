import 'package:flutter/material.dart';
import 'dart:math';
import 'package:supercitoyen/widgets/page_header.dart';
import 'package:responsive_table/ResponsiveDatatable.dart';
import 'package:responsive_table/responsive_table.dart';

class TableUser extends StatefulWidget {
  
  @override
  Body createState() => Body();
  }
class Body extends State<TableUser> {


  List<int> _perPages = [5, 10, 15, 100];
  int _total = 100;
  int _currentPerPage;
  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _source = List<Map<String, dynamic>>();
 // List<Map<String, dynamic>> _selecteds = List<Map<String, dynamic>>();
 // String _selectableKey = "id";
  String _sortColumn;
  bool _sortAscending = true;
  bool _isLoading =true;
  //bool _showSelect =false;
  List<Map<String, dynamic>> _generateData({int n: 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _source.length;
    print(i);
    for (var data in source) {
      temps.add({
        "id": i,
        "objet": "Durée du traitement lent $i",
        "nom": "Karima ait messoudane $i",
        "message": "Le traitement du problème prends… ",
       

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
    void _showDialog(){
      showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
      elevation: 10,
     content: 
     Container(
        height:460,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
                child: Column(
                  children: <Widget>[
          Container(
            
            height: 30,
            width: 500,
            child :Align(
               alignment: Alignment.topRight,
               child:Ink(
               
          decoration: const ShapeDecoration(
             color: Color(0xffFF6810),
            shape: CircleBorder(),
          
          ),
           child: IconButton(
            iconSize: 15,
            alignment: AlignmentDirectional.bottomCenter,
            icon: Icon(Icons.close),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ),
          ),
           
          ),
                    SizedBox(
                      height:10,
                    ),
                     Row(
                         children: <Widget>[
                         Container(
                         height: 100,
                         width: 50, 
                         child :Align(
                         alignment: Alignment.topCenter,
                         child:CircleAvatar(
                         radius: 40,
                         backgroundImage: NetworkImage("assets/tof citoyen.png"),  
                    ),
                       ),),
                     SizedBox(
                      width: 4,
                    ),
                    Container(
                       height: 100,
                          width: 300, //
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           Text(
                     ' Karima ait messoudane ',
                    textAlign: TextAlign.start,
                        style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     
                    ),
                    
                  ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      
                     ' Karima_aitmessoudane@gmail.com',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color:Color(0xff8F9198),
                        fontFamily: 'Roboto',
                       // fontWeight: FontWeight.normal,
                      ),
                     
                    ),
                    SizedBox(
                      height: 4,
                    ),
                            Text(
                              ' Today 08:45 PM',
                             textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 9,
                                color:Colors.black, 
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                          ],
                        ),

                    ),
                     
                    ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 290,
                          width: 500, //
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                    Text(
                       
                      'Une application utile',
                      style: TextStyle(
                        fontSize: 24,
                        color:Colors.black, 
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        
                      ),
                      textAlign: TextAlign.start,
                    ),
                   SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum fermentum facilisis libero, venenatis mattis orci hendrerit eget. Etiam ultrices mollis justo, nec fermentum elit viverra eu. Cras at cursus turpis. Nullam magna sem, vulputate quis massa nec, mollis sollicitudin dui. Sed eu massa in arcu pharetra posuere. Phasellus maximus neque non ex dapibus fringilla. Praesent nec lacinia enim. Curabitur a dui nisl.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                         fontFamily: 'Roboto',

                       // fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                   
                     ],
                    ),
                     ),
                   
                    
                   
                  ],
                ),
              ),      
    );
         
        },
      );
    }
      
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
        text: "objet du message",
        value: "objet",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Message",
        value: "message",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
       
    DatatableHeader(
      
        text: "",
        //value: "voir plus",
        show: true,
        sourceBuilder: (value, row) {
           return  Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                 onTap: _showDialog,
                  child: Material(
                    shadowColor: Colors.grey,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    color: Color(0xffFF6810),
                     
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      child: Text(
                    'Voir plus ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                       
                    ),
                  ),
                ),
              );
        },
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
                          PageHeader(text: 'Feedback des Citoyens',),
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
                              hintText: "Rechercher",
                             hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
                             enabledBorder: new OutlineInputBorder(
                              borderSide: new BorderSide(color:Color(0xff317AC1))),
                              focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide( color: Color(0xff317AC1)),
                              ),
  
                                
                               // border: InputBorder.none,
                                //border: OutlineInputBorder((borderRadius: BorderRadius.circular(5.0))),
                               
                                 /* prefixIcon: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () {
                                        setState(() {
                                          _isSearch = false;
                                        });
                                      }),*/
                                   
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
                    //selecteds: _selecteds,
                   // showSelect: _showSelect,
                    autoHeight: false,
                    onTabRow: (data) {
                      print(data);
                    },
                    onSort: (value) {
                      setState(() {
                        _sortColumn = value;
                        _sortAscending = !_sortAscending;
                        if (_sortAscending) {
                          _source.sort((a, b) =>
                              b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                        } else {
                          _source.sort((a, b) =>
                              a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                        }
                      });
                    },
                    sortAscending: _sortAscending,
                    sortColumn: _sortColumn,
                    isLoading: _isLoading,
                   /* onSelect: (value, item) {
                      print("$value  $item ");
                      if (value) {
                        setState(() => _selecteds.add(item));
                      } else {
                        setState(
                                () => _selecteds.removeAt(_selecteds.indexOf(item)));
                      }
                    },*/
                  /*  onSelectAll: (value) {
                      if (value) {
                        setState(() => _selecteds =
                            _source.map((entry) => entry).toList().cast());
                      } else {
                        setState(() => _selecteds.clear());
                      }
                    },*/
                    footers: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Ligne par page:"),
                      ),
                      if (_perPages != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                              value: _currentPerPage,
                              items: _perPages
                                  .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _currentPerPage = value;
                                });
                              }),
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child:
                        Text("$_currentPage - $_currentPerPage of $_total"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                        ),
                        onPressed: () {
                          setState(() {
                            _currentPage =
                            _currentPage >= 2 ? _currentPage - 1 : 1;
                          });
                        },
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, size: 16),
                        onPressed: () {
                          setState(() {
                            _currentPage++;
                          });
                        },
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      )
                    ],
                  ),
                ),
              ),
            ]
        )
    );
  }  }
