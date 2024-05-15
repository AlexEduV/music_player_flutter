import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {

  final Function()? onTap;
  final Color color;
  final double size;

  const PlayButton({
    super.key,
    this.onTap,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.play_circle,
        color: color,
        size: size,
      ),
    );
  }
}
