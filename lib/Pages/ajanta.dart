import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';
import'package:url_launcher/url_launcher.dart' as launcher;


class Ajanta extends StatefulWidget {
  @override
  

  _AjantaState createState() => _AjantaState();
}

Widget image_carousel = new Container(
height: 200,
child: new Carousel(
boxFit: BoxFit.cover,
images: [
AssetImage('images/ajanta/ajanta1.jpeg'),
AssetImage('images/ajanta/ajanta2.jpeg'),
AssetImage('images/ajanta/ajanta3.jpeg'),
],
autoplay: true,
animationCurve: Curves.fastOutSlowIn,
animationDuration: Duration(milliseconds: 1000),
)
);

class _AjantaState extends State<Ajanta> {

  @override
 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajanta Caves"),
      ),
        body: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            ),
            Text('''The Ajanta Caves are 30 (approximately) rock-cut Buddhist cave monuments which date from the 2nd century BCE to about 480 CE in Aurangabad district of Maharashtra state of India. The caves were built in two phases, the first phase starting around the 2nd century BCE, while the second phase was built around 400–650 CE. The caves also present paintings depicting the past lives and rebirths of the Buddha, pictorial tales from Aryasura's Jatakamala, and rock-cut sculptures of Buddhist deities. Textual records suggest that these caves served as a monsoon retreat for monks, as well as a resting site for merchants and pilgrims in ancient India.''',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20),),
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
                 onPressed:() {list.add(0);},
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



