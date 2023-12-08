import 'package:flutter/material.dart';

class CustomSnackbar {
  final String sMensaje;
  final Duration duration = const Duration(seconds: 3);
  final SnackBarBehavior behavior = SnackBarBehavior.floating;

  CustomSnackbar({
    Key? key,
    required this.sMensaje,
  });

  void show(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(sMensaje,
        style: const TextStyle(
            color: Colors.red),
      ),
      backgroundColor: Colors.black,
      duration: duration,
      behavior: behavior,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}