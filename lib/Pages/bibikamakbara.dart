import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:sah_app/Pages/daulatabad.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';

class Bibikamakbara extends StatefulWidget {
  @override

  _BibikamakbaraState createState() => _BibikamakbaraState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/bibikamakbara/bb1.jpeg'),
        AssetImage('images/bibikamakbara/bb2.jpeg'),
        AssetImage('images/bibikamakbara/bb3.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);

class _BibikamakbaraState extends State<Bibikamakbara> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bibi ka makbara"),
        ),
        body: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            ),
            Text('''It was commissioned in 1660 by the Mughal emperor Aurangzeb in the memory of his first and chief wife Dilras Banu Begum.Aurangzeb was not much interested in architecture though he had commissioned the small, but elegant, Pearl Mosque at Delhi. Due to the strong resemblance, it is also called the Dakkhani Taj (Taj of the Deccan).Bibi Ka Maqbara is believed to have been built between 1668 and 1669 C.E.  ''',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20),),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               RaisedButton.icon(
                 onPressed: home,
                 shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(30.0)),
                 icon: Icon(Icons.home),
                 label: Text("Home",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
               ),
               RaisedButton(
                  onPressed: (){list.add(1);},
                 color: Colors.orange,
                 shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(30.0)),
                 child: Text("Add to preference list",
                   style: TextStyle(
                       fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                 ),
               ),
             ],
           ),
          ],
        )
    );
  }
  void home(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home()));
  }
}
