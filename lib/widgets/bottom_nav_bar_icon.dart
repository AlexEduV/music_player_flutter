import 'package:flutter/material.dart';

class BottomNavigationBarIcon extends StatelessWidget {

  final IconData icon;

  const BottomNavigationBarIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
