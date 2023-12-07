import 'package:examen_oscar_rueda/CustomViews/CustomDrawer.dart';
import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../OnBoarding/LoginView.dart';

class HomeView extends StatelessWidget {
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
      backgroundColor: Theme.of(_context).colorScheme.background,
      appBar: AppBar(
        title: Text("H O M E"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(_context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: CustomDrawer(fOnItemTap: homeViewDrawerOnTap),
    );
  }
  void homeViewDrawerOnTap(int indice) async {
    if(indice==0){
      Navigator.pop(_context);
    }
    else if(indice==1){

    }
    else if(indice==2){
      DataHolder().fbadmin.cerrarSesion();
      Navigator.of(_context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginView()),
          ModalRoute.withName('/loginview'));
    }
  }
}