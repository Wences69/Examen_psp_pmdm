import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String sHint;
  final bool blIsPasswd;
  final TextEditingController tecControler;
  final IconButton? iconButton;

  const CustomTextField({
    Key? key,
    required this.sHint,
    required this.blIsPasswd,
    required this.tecControler,
    this.iconButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tecControler,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      obscureText: blIsPasswd,
      enableSuggestions: !blIsPasswd,
      autocorrect: !blIsPasswd,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          hintText: sHint,
          suffixIcon: iconButton
      ),
    );
  }
}