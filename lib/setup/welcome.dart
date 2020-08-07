import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sah_app/setup/sign_in.dart';
import 'package:sah_app/setup/sign_up.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My app"),
      ),body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          onPressed: NavigateToSignIn,
          child: Text("Sign in"),
        ),
        RaisedButton(
          onPressed: NavigateToSignUp,
          child:Text("Sign up"),
        )
      ],
    ),
    );
  }

  void NavigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));
  }

  void NavigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),fullscreenDialog: true));
  }
}
