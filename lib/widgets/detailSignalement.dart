import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supercitoyen/widgets/MapsSpace.dart';
import 'package:supercitoyen/widgets/navbar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:supercitoyen/save_file_web.dart';
import 'package:flutter/services.dart';

class DetailSignalement extends StatelessWidget {
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
            child: Container(
            padding: EdgeInsets.only(right: 5, left: 5, top: 5 ),
            width: MediaQuery.of(context).size.width*0.55 ,
        child:  SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween	,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Container(
                height:40,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child:Align(      
                 alignment: Alignment.topLeft, 
                 child:RaisedButton.icon(
                  onPressed: (){ 
              Navigator.of(context).pushNamed('/Signalement'); 
             },
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  label: Text('Retour', 
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  ),),
                  icon: Icon(Icons.arrow_back_ios, color:Colors.black26,size: 15,), 
                  textColor: Colors.black,
                  splashColor: Colors.grey[300],
                  color: Color(0xff969696),),
                ),
              ),
              Spacer(),
              Container(
              child:Align(     
              alignment: Alignment.topLeft, 
              child:RaisedButton.icon(
                  onPressed: (){ 
                    //le code de la methode pour pouvoir imprimer le fichier pdf generer
                  },
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  label: Text('Imprimer',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  ),), 
                  icon: Icon(Icons.print, color:Colors.white,), 
                  textColor: Colors.white,
                  splashColor: Colors.blue,
                  color: Color(0xff317AC1),),
                ),),
                 SizedBox(width:10),
                 Container(
                child:Align(
                alignment: Alignment.topRight, 
                child:RaisedButton.icon(
                  onPressed: _createPDF, //generation du fichier pdf 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
                  label: Text('Enregister', 
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),),
                  icon: Icon(Icons.save, color:Colors.white,), 
                  textColor: Colors.white,
                  splashColor: Colors.orange[200],
                  color: Color(0xffF5A02F),),
                 ),),  
           ],
         ),),
         SizedBox(height: 10),
          Container(
              color: Color(0xffEBEBEB),
               child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [  
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
                ],
              ),
              SizedBox(height: 10),
              //Categorie 
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 
                  SizedBox(width:20),
                  Text(
                    'Catégorie: ',
                    style: TextStyle(
                      color: Color.fromRGBO(34, 43, 69, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Déchets',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              //Lieu
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:18),
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
            //Qui a signale 
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width:20),
                  Text(
                    'Envoye par : ',
                    style: TextStyle(
                      color: Color.fromRGBO(34, 43, 69, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                  
                  Text(
                    'Karima ait messoudane',
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
                    'Date d''envoie : ',
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
              SizedBox(height: 10),
            //Date du  mis a jour du signalement
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width:20),
                  Text(
                    'Date du derniere mis ajour : ',
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
              SizedBox(height: 10),
              //Etat
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width:20),
                  Text(
                    'Etat : ',
                    style: TextStyle(
                      color: Color.fromRGBO(34, 43, 69, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
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
              //Réglé il y a :
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width:20),
                  Text(
                    'Réglé il y a : ',
                    style: TextStyle(
                      color: Color.fromRGBO(34, 43, 69, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '5 jours',
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
              //Description
               Row(
                 children: <Widget>[
              SizedBox(width:20),
              Text(
                'Description : ',
                style: TextStyle(
                  color: Color.fromRGBO(34, 43, 69, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                ),
              ),],),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20,),
                child: Text(
                  "les dechets sont jetees dans un mal endroit ,donne une mauvaise odeur et un paysage desagreable faut les enlever de cette place et interdir de jeter les ordures dans cette derniere .  ",
                 style: TextStyle(
                 color: Color.fromRGBO(34, 43, 69, 1).withOpacity(0.8),
                 fontFamily: 'Roboto',
                  fontSize: 15,
                  ),
                  ),
                  ), 
               SizedBox(height: 10),
                  ],
                  ),
                  ),
               SizedBox(height:10),
               Container(
                height: 230,
                margin: EdgeInsets.only(bottom: 10),
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
                ),
              Align(
              alignment: Alignment.bottomRight,
              child: Map(),),
               ],
               ),
               ],
               ), 
               ),
               );
}




//le code de generation du fichier pdf :
Future<void> _createPDF() async {
    //Cree le document PDF.
    final PdfDocument document = PdfDocument();
    //Ajouter des pages au documents pdf
    final PdfPage page = document.pages.add();
    //Avoir la taille de la page 
    final Size pageSize = page.getClientSize();
    //Dessiner un rectangle
    page.graphics.drawRectangle(
    bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
    pen: PdfPen(PdfColor(142, 170, 219, 255)));
    //Dessiner la section header
    drawHeader(page, pageSize);
    //Charger le texte 
    PdfTextElement textElement = PdfTextElement(
    text:
    '    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It was popularised in the 1960s with the release of Letraset sheets',
    font: PdfStandardFont(PdfFontFamily.helvetica, 12));
    //Desssiner le paragraphe dans la page
    PdfLayoutResult layoutResult = textElement.draw(
    page: page,
    bounds: Rect.fromLTWH(
    0, 185, page.getClientSize().width, page.getClientSize().height));
    //Ajouter un titre au paragraphe
    textElement.text = '   Description';
    textElement.font =
    PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold);
    //Dessinez le texte d'en-tête sur la page, sous le texte du paragraphe avec un écart de hauteur de 30 et maintenez la position dans PdfLayoutResult
    layoutResult = textElement.draw(
    page: page,
    bounds: Rect.fromLTWH(0, layoutResult.bounds.top-30, 0, 0));
    //Ajouter le footer
    drawFooter(page, pageSize);
    //Enregister le document et lancer son telechargement
    final List<int> bytes = document.save();
    //Disposer le document.
    document.dispose();
    SaveFilehelper.saveAndOpenFile(bytes);
}

  //Dessiner le header
  PdfLayoutResult drawHeader(PdfPage page, Size pageSize) {
  page.graphics.drawRectangle(
  brush: PdfSolidBrush(PdfColor(91, 126, 215, 255)),
  bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
  page.graphics.drawString(
  'Super Citoyen', PdfStandardFont(PdfFontFamily.helvetica, 30),
  brush: PdfBrushes.white,
  bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
  format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
  
  final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
  //Ccree la date et  le convertir en format de chaine de caractere
  final DateFormat format = DateFormat.yMMMMd('en_US');
  final String numerotelephone = 'Le: ' +
  format.format(DateTime.now());
  final Size contentSize = contentFont.measureString(numerotelephone );
  const String address =
  'De:Super Citoyen\r\n\r\n';
  PdfTextElement(text: numerotelephone , font: contentFont).draw(
  page: page,
  bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
  contentSize.width + 30, pageSize.height - 120));
  return PdfTextElement(text: address, font: contentFont).draw(
  page: page,
  bounds: Rect.fromLTWH(30, 120,
  pageSize.width - (contentSize.width + 30), pageSize.height - 120));
}

  //Dessiner le footer
void drawFooter(PdfPage page, Size pageSize) {   
  final PdfPen linePen =
  PdfPen(PdfColor(142, 170, 219, 255), dashStyle: PdfDashStyle.custom);
  linePen.dashPattern = <double>[3, 3];
  page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
  Offset(pageSize.width, pageSize.height - 100));
  const String footerContent =
    'Super Citoyen\n\r\nCyber parck-Sidi Abdelah,Alger,Algerie\r\n\r\nNumero telephone:02158557939';
  page.graphics.drawString(
    footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
    format: PdfStringFormat(alignment: PdfTextAlignment.right),
    bounds: Rect.fromLTWH(pageSize.width - 35, pageSize.height - 70, 0, 0));
  }



}

 
 
 
