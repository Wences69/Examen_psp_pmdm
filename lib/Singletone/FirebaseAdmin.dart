import 'package:firebase_auth/firebase_auth.dart';

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

}