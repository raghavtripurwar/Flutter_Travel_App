import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:sah_app/Pages/paithan.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:sah_app/Pages/pageview.dart';

class Gws extends StatefulWidget {
  @override
  _GwsState createState() => _GwsState();
}

Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/gws/gws1.jpeg'),
        AssetImage('images/gws/gws1.jpeg'),
        AssetImage('images/gws/gws1.jpeg'),
        AssetImage('images/gws/gws4.jpeg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    )
);


class _GwsState extends State<Gws> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
            title: Text("Gautala Wildlife Sanctuary"),
          ),
          body: ListView(
            children: <Widget>[
              image_carousel,
              Padding(
                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              ),
              Text("Gautala Autramghat Sanctuary is a protected area of Maharashtra state, India. It lies in the Satmala and Ajantha hill ranges of the Western Ghats, and administratively is in Aurangabad District and Jalgaon District. The wildlife sanctuary was established in 1986 in an existing reserved forest area.",style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20)),

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
                  onPressed: (){list.add(5);},
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

