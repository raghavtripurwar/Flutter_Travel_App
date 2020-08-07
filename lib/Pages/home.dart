import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sah_app/Pages/hotelmap.dart';
import 'package:sah_app/quiz/quiz.dart';
import 'package:sah_app/setup/sign_out.dart';
import 'package:sah_app/setup/welcome.dart';
import 'package:sah_app/Pages/pageview.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

Widget image_carousel = new Container(
  height: 200,
  child: new Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('images/img1.jpg'),
      AssetImage('images/img2.jpg'),
      AssetImage('images/img3.jpg'),
      AssetImage('images/img4.jpeg'),
      AssetImage('images/img5.jpeg'),
      AssetImage('images/img6.jpeg'),
      AssetImage('images/img7.jpg')
    ],
    autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),

  ),
);
class _HomeState extends State<Home> {
  Logout logout = Logout();
  void Signout() async{
    try{
      await logout.signout();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    }
    catch(e){
      print(e.message);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          RaisedButton.icon(onPressed: Signout,
            icon: Icon(Icons.power_settings_new)
            , label: Text("logout"),
            color: Colors.white,

          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          image_carousel,
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          RaisedButton(
            onPressed:pageview,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("View Famous places",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            ),
          ),
          RaisedButton(
            onPressed:quiz,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("Play Quiz",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            ),
          ),
          RaisedButton(
            onPressed:maps,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("View and book hotels",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            ),
          ),
          RaisedButton(
            onPressed:() {},
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("Camerio",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            ),
          ),

        ],
      )
    );
  }
  bool checkState(){
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    var user = _firebaseAuth.currentUser();
    if (user!=null) {
      // user is signed in.
      return true;
    } else {
      // No user is signed in.
      return false;
    }
  }
  void pageview(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Pageview()));
  }

  void quiz(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AnimalQuiz()));
  }

  void maps(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Hotel_Page()));
  }
}

