import 'package:flutter/material.dart';

class PostGridView extends StatelessWidget {
  final String sTitle;
  final String sBody;

  const PostGridView({
    Key? key,
    required this.sTitle,
    required this.sBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Aquí puedes personalizar la apariencia de tu celda de publicación
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
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
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            sBody,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}