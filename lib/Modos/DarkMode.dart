import 'package:flutter/material.dart';

ThemeData DarkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.black,
        primary: Colors.grey.shade900,
        secondary: Colors.grey.shade800,
        inversePrimary: Colors.grey.shade300
    ),
    textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.grey[300],
        displayColor: Colors.white
    )
);