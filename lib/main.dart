import 'package:flutter/material.dart';
import 'package:sah_app/setup/sign_in.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sah',
      home: LoginPage(),
    );
  }


}



