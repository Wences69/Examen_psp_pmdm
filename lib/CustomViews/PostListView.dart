import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final String sTitle;
  final String sBody;
  final int iPosicion;
  final Function(int indice)? fOnItemTap;
  final Function(int indice)? fOnItemLongPressed;

  const PostListView({
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              sBody,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
