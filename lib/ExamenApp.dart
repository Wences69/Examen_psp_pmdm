import 'package:flutter/material.dart';

import 'Modos/DarkMode.dart';
import 'Modos/LightMode.dart';
import 'OnBoarding/LoginView.dart';
import 'OnBoarding/RegisterView.dart';
import 'Splash/SplashView.dart';


class ExamenApp extends StatelessWidget {
  const ExamenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Oscar Rueda Kollmer',
      debugShowCheckedModeBanner: false,
      routes: {
        '/loginview': (context) => LoginView(),
        '/registerview': (context) => RegisterView(),
        '/splashview': (context) => SplashView()
      },
      initialRoute: '/loginview',
      theme: LightMode,
      darkTheme: DarkMode,
    );
  }
}
