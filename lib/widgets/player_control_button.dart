import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerControlButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function()? onTap;


  const PlayerControlButton({
    super.key,
    required this.icon,
    this.size = 30,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: FaIcon(
          icon,
          size: size,
        ),
      ),
      disabledColor: Colors.grey,
      color: Colors.white,
    );
  }
}
