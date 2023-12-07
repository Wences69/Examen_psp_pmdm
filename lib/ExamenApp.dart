import 'package:examen_oscar_rueda/Main/HomeView.dart';
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
        '/homeview' : (context) => HomeView(),
        '/splashview': (context) => SplashView()
      },
      initialRoute: '/splashview',
      theme: LightMode,
      darkTheme: DarkMode,
    );
  }
}
