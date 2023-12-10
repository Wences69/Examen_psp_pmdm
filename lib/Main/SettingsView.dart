import 'package:examen_oscar_rueda/FirestoreObjects/FbPost.dart';
import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';

import '../CustomViews/CustomButton.dart';
import '../CustomViews/CustomSnackbar.dart';
import '../CustomViews/CustomTextField.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
      title: Text("Ajustes",
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
          )
        ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      )
    );
  }
}
