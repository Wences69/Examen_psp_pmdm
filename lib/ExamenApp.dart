import 'package:examen_oscar_rueda/Main/PostView.dart';
import 'package:examen_oscar_rueda/Main/HomeView.dart';
import 'package:flutter/material.dart';
import 'Main/PostCreateView.dart';
import 'Main/PostEditView.dart';
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
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => const RegisterView(),
        '/homeview' : (context) => const HomeView(),
        '/splashview': (context) => SplashView(),
        '/postview': (context) => PostView(),
        '/postcreateview': (context) => PostCreateView(),
        '/posteditview': (context) => PostEditView(),
      },
      initialRoute: '/splashview',
      theme: LightMode,
      darkTheme: DarkMode,
    );
  }
}
