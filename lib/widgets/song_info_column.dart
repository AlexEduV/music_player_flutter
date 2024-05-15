import 'package:flutter/material.dart';

class SongInfoColumn extends StatelessWidget {

  final String songTitle;
  final String artistName;

  const SongInfoColumn({
    super.key,
    required this.songTitle,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          songTitle,
          style: const TextStyle(
            color: Color(0xff462276),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),

        Text(
          artistName,
          style: const TextStyle(
            color: Color(0xff462276),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
