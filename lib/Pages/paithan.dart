import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sah_app/Pages/panchakki.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';

class Paithan extends StatefulWidget {
  @override
  _PaithanState createState() => _PaithanState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/paithan/paithan1.jpeg'),
        AssetImage('images/paithan/paithan2.jpeg'),
        AssetImage('images/paithan/paithan3.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);

class _PaithanState extends State<Paithan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("paithan"),
        ),
        body: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            ),
            Text("Paithan is associated with many spiritual leaders of all faiths since ages. To name some of them are - Changdev Maharaj, Saint Dnyaneshwar, Saint Sopandev, Saint Nivruttinath, Saint Muktabai, Saint Eknath, Saint Jaganade Maharaj, Saint Bhanudas, Gaga Bhatta, etc. Paithan was the home town and Samadhi sthal of the great Marathi saint Eknath; people flock yearly to his shirne during the time of the Paithan yatra.",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20)),
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
                 onPressed: (){list.add(6);},
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
