import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/widgets/player_page/player_control_button.dart';

import 'package:music_player_flutter/model/song.dart';

class PlayerControlsRow extends StatelessWidget {

  final Song openedSong;
  final int songIndex;
  final DataModel model;


  const PlayerControlsRow({
    super.key,
    required this.openedSong,
    required this.songIndex,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const PlayerControlButton(
            icon: FontAwesomeIcons.backward,
            onTap: null,
          ),

          PlayerControlButton(
            icon: openedSong.isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
            size: 40,
            onTap: () {
              model.playSong(songIndex);
            },
          ),

          const PlayerControlButton(
            icon: FontAwesomeIcons.forward,
            onTap: null,
          ),

        ],
      ),
    );
  }
}
