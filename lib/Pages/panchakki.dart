import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sah_app/Pages/sb.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';

class Panchakki extends StatefulWidget {
  @override
  _PanchakkiState createState() => _PanchakkiState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/panchakki/pc1.jpeg'),
        AssetImage('images/panchakki/pc2.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);

class _PanchakkiState extends State<Panchakki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Panchakki"),
        ),
        body: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            ),
            Text('''Panchakki, known as the water mill. This monument is located in Aurangabad, Maharashtra, displays the scientific thought process put in medieval Indian architecture. It was designed to generate energy via water brought down from a spring on a mountain. The building, attached to the dargah of Baba Shah Musafir a Sufi saint is located in a garden near the Mahmud Darvaza and consist of a mosque, a madrassa, a kacheri, a minister's house, a sarai and houses for zananas.

 ''',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20)),
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
                 onPressed: (){list.add(7);},
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
