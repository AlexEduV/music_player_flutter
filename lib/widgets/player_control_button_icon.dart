import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerControlButtonIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const PlayerControlButtonIcon({
    super.key,
    required this.icon,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      size: size,
      color: Colors.white,
    );
  }
}
