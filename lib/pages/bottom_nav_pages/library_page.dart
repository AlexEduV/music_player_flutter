
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_player_flutter/style/color_helper.dart';
import 'package:music_player_flutter/helpers/date_helper.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/widgets/library_page/library_list_tile.dart';
import 'package:music_player_flutter/widgets/page_title.dart';

import 'package:on_audio_query/on_audio_query.dart';

import 'package:music_player_flutter/model/song.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  late List<Song> songs = [];

  final OnAudioQuery audioQuery = OnAudioQuery();
  late bool _hasPermission = false;

  @override
  void initState() {
    super.initState();

    songs = [];
    checkAndRequestPermissions();

  }

  @override
  Widget build(BuildContext context) {

    songs = DataModel.songs;

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorHelper.mainColor,
            ColorHelper.mainLighterColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Gap(30.0),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: PageTitle(
              title: 'Library',
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (BuildContext context, int index) {

                return LibraryListTile(
                  song: songs[index],
                  cover: QueryArtworkWidget(
                    id: songs[index].id,
                    type: ArtworkType.AUDIO,
                    controller: audioQuery,
                    nullArtworkWidget: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/album_cover_placeholder.png'),
                        )
                      ),
                    ),
                  ),
                );
              },

            ),
          ),
        ],
      ),
    );
  }

  checkAndRequestPermissions({bool retry = false}) async {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    // Only call update the UI if application has all required permissions.
    _hasPermission ? getSongs() : null;
  }

  void getSongs() async {

    // Query Audios
    List<SongModel> all = await audioQuery.querySongs();

    DataModel.songs = [];
    int id = 0;

    //filter just music
    for (final audio in all) {
      if (audio.isMusic ?? false) {
        DataModel.songs.add(
          Song(
            id: id,
            title: audio.title,
            artist: audio.artist ?? '',
            album: audio.album ?? '',
            maxTime: getTimeStringFromDouble((audio.duration ?? 0.0) / 1000),
            source:'${audio.uri}',
            isStatic: false,
          )
        );

        id++;
      }
    }

    setState(() {});
  }
}
