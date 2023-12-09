import 'package:flutter/material.dart';

class PostGridView extends StatelessWidget {
  final String sTitle;
  final String sBody;
  final int iPosicion;
  final Function(int indice)? fOnItemTap;
  final Function(int indice)? fOnItemLongPressed;

  const PostGridView({
    Key? key,
    required this.sTitle,
    required this.sBody,
    required this.iPosicion,
    required this.fOnItemTap,
    required this.fOnItemLongPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => fOnItemTap!(iPosicion),
      onLongPress: () => fOnItemLongPressed!(iPosicion),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sTitle,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              sBody,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
