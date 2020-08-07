import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/tripplan.dart';
import 'package:sah_app/Pages/pageview.dart';

class Sulibhanjan extends StatefulWidget {
  @override
  _SulibhanjanState createState() => _SulibhanjanState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/sb/sb1.jpeg'),
        AssetImage('images/sb/sb2.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);

class _SulibhanjanState extends State<Sulibhanjan> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("sulibhanjan"),
          ),
          body: ListView(
            children: <Widget>[
              image_carousel,
              Padding(
                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              ),
              Text('''Shuli Bhanjan is a hill near Aurangabad, Maharashtra City on the way to Ellora Caves. This place is situated near Daulatabad fort and is accessible by road. The height is about 400 feet (exact not known). Eknath Maharaj is believed to have carried his 'Tapyasya' at this very location travelling daily by foot from Daulatabad fort where he was employed. It seems there was an underground passage from Devgiri fort to this place which Eknath Maharaj would take.''',style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20)),
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
                  onPressed: (){list.add(8);},
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
              RaisedButton(
                onPressed: map,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text("Submit",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          )
      );
  }
  void home(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home()));
  }
  void map(){
    for(var i=0;i<list.length;i++)
      print(list[i]);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Container(child: Map_Page(list),)));
  }
}
