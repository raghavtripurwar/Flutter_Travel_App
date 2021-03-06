import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sah_app/Pages/ghrish.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';

class Ellora extends StatefulWidget {
  @override
  _ElloraState createState() => _ElloraState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/ellora/ellora1.jpeg'),
        AssetImage('images/ellora/ellora2.jpeg'),
        AssetImage('images/ellora/ellora3.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);

class _ElloraState extends State<Ellora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ellora"),
        ),
        body: ListView(
          children: <Widget>[
            image_carousel,
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            ),
            Text("Ellora (\e-ˈlȯr-ə\, IAST: Vērūḷ) (एलोरा) is a UNESCO World Heritage Site located in the Aurangabad district of Maharashtra, India. It is one of the largest rock-cut monastery-temple cave complexes in the world, featuring Hindu, Buddhist and Jain monuments, and artwork, dating from the 600–1000 CE period.[1][2] Cave 16, in particular, features the largest single monolithic rock excavation in the world, the Kailasha temple, a chariot shaped monument dedicated to Shiva.",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20)),
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
                  onPressed:() {list.add(3);},
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
