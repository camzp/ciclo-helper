import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signEmailPassword(String email, String password);
  Future<String> createUserEmailPassword(String email, String password);
  Future<String> currentUser();
}

class Auth implements BaseAuth {
  Future<String> signEmailPassword(String email, String password) async{
    AuthResult a = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = a.user;
    return user.uid;
  }

  Future<String> createUserEmailPassword(String email, String password) async{
    AuthResult a = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = a.user;
    return user.uid;
  }
  
  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
}
