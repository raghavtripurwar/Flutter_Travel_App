import 'package:firebase_auth/firebase_auth.dart';

class Logout{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signout() async{
    await _firebaseAuth.signOut();
  }


}