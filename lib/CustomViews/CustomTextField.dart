import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String sHint;
  final bool blIsPasswd;
  final TextEditingController tecControler;
  final IconButton? iconButton;

  const CustomTextField({
    super.key,
    required this.sHint,
    required this.blIsPasswd,
    required this.tecControler,
    this.iconButton
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tecControler,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          hintText: sHint,
          suffixIcon: iconButton
      ),
      obscureText: blIsPasswd,
    );
  }
}