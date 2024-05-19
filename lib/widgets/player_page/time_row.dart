import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/model/song.dart';

class TimeRow extends StatelessWidget {

  final int openedSongIndex;

  const TimeRow({
    super.key,
    required this.openedSongIndex,
  });

  @override
  Widget build(BuildContext context) {

    DataModel model = context.watch<DataModel>();
    Song openedSong = model.getSongById(openedSongIndex);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            openedSong.currentTime,
            style: TextStyle(color: Colors.grey[200]),
          ),

          Text(
            openedSong.maxTime,
            style: TextStyle(color: Colors.grey[200]),
          ),
        ],
      ),
    );
  }
}
