import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sah_app/Pages/ellora.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';

class Daulatabad extends StatefulWidget {
  @override
  _DaulatabadState createState() => _DaulatabadState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/db1.jpeg'),
        AssetImage('images/db2.jpeg'),
        AssetImage('images/db3.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);


class _DaulatabadState extends State<Daulatabad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daulatabad"),
        ),
        body: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            ),
            Text('''However, Muhammad bin Tughluq reversed his decision in 1334 and the capital of the Delhi Sultanate was shifted back from Daulatabad to Delhi.It was the capital of the Yadava dynasty (9th century–14th century CE), for a brief time the capital of the Delhi Sultanate (1327–1334), and later a secondary capital of the Ahmadnagar Sultanate (1499–1636). Around the sixth century CE, Devagiri emerged as an important uplands town near present-day Aurangabad, along caravan routes going towards western and southern India.  ''',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20),),
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
                  onPressed: (){list.add(2);},
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

