import 'package:flutter/material.dart';
import 'package:music_player_flutter/helpers/color_helper.dart';

class SongInfoColumn extends StatelessWidget {

  final String songTitle;
  final String artistName;
  final Color color;
  final double scale;

  const SongInfoColumn({
    super.key,
    required this.songTitle,
    required this.artistName,
    this.color = ColorHelper.mainColor,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          songTitle,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14 * scale,
          ),
        ),

        Text(
          artistName,
          style: TextStyle(
            color: color,
            fontSize: 12 * scale,
          ),
        ),
      ],
    );
  }
}
