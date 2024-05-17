import 'package:flutter/material.dart';
import 'package:music_player_flutter/widgets/play_button.dart';
import 'package:music_player_flutter/widgets/song_info_column.dart';

import 'package:music_player_flutter/model/model.dart';

class CoverFlowBottomSection extends StatelessWidget {
  final int index;

  const CoverFlowBottomSection({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18.0),
            bottomRight: Radius.circular(18.0),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //song details
            SongInfoColumn(
              songTitle: DataModel.trendingMusic[index].name,
              artistName: DataModel.trendingMusic[index].artist,
            ),

            //play/pause button
            const PlayButton(
              color: Color(0xff462276),
              size: 20,
            ),

          ],
        ),
      ),
    );
  }
}
