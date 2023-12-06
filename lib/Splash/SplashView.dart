import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:examen_oscar_rueda/Singletone/FirebaseAdmin.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
            child: Icon(Icons.icecream_rounded)
        )
    );
  }
}
