import 'package:flutter/material.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/widgets/playlist_details_page/song_list_tile.dart';

import 'package:music_player_flutter/model/song.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {

    final DataModel model = context.read<DataModel>();

    final List<Song> allSongs = [
      model.getSongById(1)
    ];

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff462276),
            Color(0xff7A558C),
          ],
        ),
      ),
      child: ListView.builder(
        itemCount: allSongs.length,
        itemBuilder: (BuildContext context, int index) {
          return SongListTile(
            index: index,
            songTitle: allSongs[index].title,
            album: allSongs[index].album,
            artist: allSongs[index].artist,
            maxTime: allSongs[index].maxTime,
            coverSource: allSongs[index].coverSource,
          );
        },

      ),
    );
  }
}
