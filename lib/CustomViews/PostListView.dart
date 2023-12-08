import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final String sText;
  // final Function(int indice)? onItemListClickedFun;

  const PostListView({
    Key? key,
    required this.sText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            Text(sText),
          ],
        ),
      ),
    );
  }
}