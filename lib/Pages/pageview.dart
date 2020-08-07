import 'package:flutter/material.dart';
import 'package:sah_app/Pages/daulatabad.dart';
import 'package:sah_app/Pages/ajanta.dart';
import 'package:sah_app/Pages/ellora.dart';
import 'package:sah_app/Pages/ghrish.dart';
import 'package:sah_app/Pages/gws.dart';
import 'package:sah_app/Pages/paithan.dart';
import 'package:sah_app/Pages/panchakki.dart';
import 'package:sah_app/Pages/sb.dart';
import 'package:sah_app/Pages/bibikamakbara.dart';
import 'package:sah_app/Pages/ajanta.dart';
 List<int> list = [];
 class Pageview extends StatefulWidget {
   @override
   _PageviewState createState() => _PageviewState();
 }

 class _PageviewState extends State<Pageview> {



   List<Widget> mypages = [Ajanta(),Ellora(),Bibikamakbara(),Daulatabad(),Ghrish(),Gws(),Paithan(),Panchakki(),Sulibhanjan()];


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: PageView.builder(
           itemBuilder: (context,position)=>mypages[position],
         controller: PageController(),
         itemCount: mypages.length,
       )
     );
   }
 }
