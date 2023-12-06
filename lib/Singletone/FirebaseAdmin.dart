import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAdmin {

  String? getCurrentUserID(){
    return FirebaseAuth.instance.currentUser?.uid;
  }

  User? getCurrentUser(){
    return FirebaseAuth.instance.currentUser;
  }

  FirebaseAuth getFirebaseAuthInstance(){
    return FirebaseAuth.instance;
  }

  void iniciarSesion(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}