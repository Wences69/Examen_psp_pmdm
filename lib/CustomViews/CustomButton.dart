import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String sText;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.sText,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Text(
            sText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }


}