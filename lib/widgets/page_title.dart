import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  final String title;

  const PageTitle({
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }
}
