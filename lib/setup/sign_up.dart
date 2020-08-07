import 'package:firebase_auth/firebase_auth.dart';
import 'package:sah_app/setup/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  String _email, _password;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(14, 29, 14, 29),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if(input.isEmpty){
                      return 'Provide an email';
                    }
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                TextFormField(
                  validator: (input) {
                    if(input.length < 7){
                      return 'Please provide a password of atleast 7 characters';
                    }
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                 FormBuilder(
                  key: _fKey,
                  initialValue: {
                    'date': DateTime.now(),
                    'accept_terms': false,
                  },
                  autovalidate: true,
                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      hintText: 'Name',
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
                    ),
                    controller: myController1,
                 ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: 'Age',
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
                        ),
                        controller: myController2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: 'Country',
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
                        ),
                        controller: myController3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          hintText: 'Gender',
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
                        ),
                        controller: myController4,
                      ),

                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: signUp,
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
          )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Firestore.instance.runTransaction((transaction) async {
          await transaction.set(Firestore.instance.collection("users").document(), {
                'name':myController1.text,
                'age':myController2.text,
                'ethinicity':myController3.text,
                'gender':myController4.text
          });
        });
//       Firestore.instance.collection("users").document('eZtmWKt3N3fIQxU8IWtG').setData({'name':myController1.text,'age':myController2.text,'ethinicity':myController3.text,'gender':myController4.text});
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
