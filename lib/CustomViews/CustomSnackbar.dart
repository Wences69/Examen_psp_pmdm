import 'package:flutter/material.dart';

class CustomSnackbar {
  final String sMensaje;
  final Color cBackgroundColor;
  final Color cTextColor;
  final Duration duration = const Duration(seconds: 3);
  final SnackBarBehavior behavior = SnackBarBehavior.floating;

  CustomSnackbar({
    required this.sMensaje,
    this.cBackgroundColor = Colors.red,
    this.cTextColor = Colors.black,
  });

  void show(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(sMensaje,
        style: TextStyle(
            color: cTextColor),
      ),
      backgroundColor: cBackgroundColor,
      duration: duration,
      behavior: behavior,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
