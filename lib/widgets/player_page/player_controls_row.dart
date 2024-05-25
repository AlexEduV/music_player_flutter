import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/widgets/player_page/player_control_button.dart';

import 'package:music_player_flutter/model/song.dart';
import 'package:provider/provider.dart';

class PlayerControlsRow extends StatelessWidget {

  final int openedSongIndex;
  final List<Song> listToUpdate;

  const PlayerControlsRow({
    super.key,
    required this.openedSongIndex,
    required this.listToUpdate,
  });

  @override
  Widget build(BuildContext context) {

    DataModel model = context.watch<DataModel>();


    Song openedSong = model.getSongById(listToUpdate, openedSongIndex);

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
              debugPrint('audio source: ${openedSong.source}');

              model.playSong(listToUpdate, openedSongIndex, source: openedSong.source);
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
