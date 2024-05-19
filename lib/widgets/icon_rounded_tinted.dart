import 'package:flutter/material.dart';

class IconRoundedTinted extends StatelessWidget {
  final IconData icon;
  final double? size;

  const IconRoundedTinted({
    super.key,
    required this.icon,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(72.0,),
        color: Colors.black38,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: size,
      ),
    );
  }
}
