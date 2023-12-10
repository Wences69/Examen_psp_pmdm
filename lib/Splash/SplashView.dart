import 'package:flutter/material.dart';
import '../Singletone/DataHolder.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView>{

  @override
  void initState() {
    super.initState();
    checkSession();
  }

  void checkSession() async {
    await Future.delayed(Duration(seconds: 4));
    if (DataHolder().fbadmin.getCurrentUserID() != null) {
        Navigator.of(context).popAndPushNamed("/homeview");
      }
    else {
        Navigator.of(context).popAndPushNamed("/loginview");
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              strokeWidth: 6.0,
            )
          ],
        ),
      ),
    );
  }
}