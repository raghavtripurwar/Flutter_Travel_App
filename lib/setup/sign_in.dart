import 'package:firebase_auth/firebase_auth.dart';
import 'package:sah_app/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:sah_app/setup/resetpassword.dart';
import 'package:sah_app/setup/sign_up.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(14, 29, 14, 14),
          child: Form(
              key: _formKey,
              child: Opacity(
                opacity: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset('images/LOGO.png',height: 100,width: 100,),
                      Container(
                        child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Provide an email';
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20,color:Colors.white),
                              hintText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.orange
                                )
                              ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 3,
                              ),
                            ),
                              prefixIcon: Padding(
                                child: IconTheme(
                                  data: IconThemeData(color: Colors.orange),
                                  child: Icon(Icons.email),
                                ),
                                padding: EdgeInsets.only(left: 30, right: 10),
                              )
                          ),
                          onSaved: (input) => _email = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Longer password please';
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 20,color:Colors.white),
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.orange
                              )
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 3,
                            ),
                          ),
                            prefixIcon: Padding(
                              child: IconTheme(
                                data: IconThemeData(color: Colors.orange),
                                child: Icon(Icons.lock),
                              ),
                              padding: EdgeInsets.only(left: 30, right: 10),
                            )
                        ),
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: signIn,
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text("Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                            ),
                          ),
                          RaisedButton(
//                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Reset({_email}))), child: null,

                            child: Text('Forgot Password',style: TextStyle(fontStyle: FontStyle.italic,color:Colors.white)),
                          ),
                        ],
                      ),
                      Text("Dont Have An Account?",style: TextStyle(fontStyle: FontStyle.italic,color:Colors.black)),
                      RaisedButton(
                        onPressed: signup,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text("Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        AuthResult result = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        FirebaseUser user = result.user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
  void signup(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
  }

}