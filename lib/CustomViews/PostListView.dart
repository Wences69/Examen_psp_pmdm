import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final String sTitle;
  final String sBody;

  const PostListView({
    Key? key,
    required this.sTitle,
    required this.sBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
