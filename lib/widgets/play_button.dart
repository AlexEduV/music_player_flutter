import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {

  final Function()? onTap;
  final Color backgroundColor;
  final Color? tintColor;
  final double size;

  const PlayButton({
    super.key,
    this.onTap,
    required this.tintColor,
    required this.backgroundColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(64.0),
        ),
        child: Icon(
          Icons.play_arrow,
          color: tintColor,
          size: 14,
        ),
      ),
    );
  }
}
