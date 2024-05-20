
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_player_flutter/widgets/playlist_details_page/song_list_tile.dart';

import 'package:on_audio_query/on_audio_query.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  late List<SongModel> songs = [];

  @override
  void initState() async {
    super.initState();

    final OnAudioQuery audioQuery = OnAudioQuery();

    // Query Audios
    songs = await audioQuery.querySongs();

  }

  @override
  Widget build(BuildContext context) {

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Gap(30.0),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Library',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (BuildContext context, int index) {
                return SongListTile(
                  index: index,
                  songTitle: songs[index].title,
                  album: songs[index].album ?? '',
                  artist: songs[index].artist ?? '',
                  maxTime: '0:00',
                  coverSource: allSongs[index].coverSource,
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}
