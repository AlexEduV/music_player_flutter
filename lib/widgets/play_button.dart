import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color:  const Color(0xff462276),
        borderRadius: BorderRadius.circular(64.0),
      ),
      child: const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.play_arrow,
          color: Colors.white60,
          size: 12,
        ),
      ),
    );
  }
}
