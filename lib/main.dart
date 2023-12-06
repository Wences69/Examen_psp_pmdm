import 'package:examen_oscar_rueda/ExamenApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Singletone/DataHolder.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DataHolder().initDataHolder();
  ExamenApp examenapp = ExamenApp();
  runApp(examenapp);
}
