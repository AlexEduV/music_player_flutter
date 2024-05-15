import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color:  const Color(0xff462276),
        borderRadius: BorderRadius.circular(64.0),
      ),
      child: Icon(
        Icons.play_arrow,
        color: Colors.grey[300],
        size: 18,
      ),
    );
  }
}
