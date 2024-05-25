import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/helpers/date_helper.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/widgets/icon_rounded_tinted.dart';
import 'package:music_player_flutter/widgets/player_page/player_controls_row.dart';
import 'package:music_player_flutter/widgets/player_page/time_row.dart';
import 'package:music_player_flutter/widgets/song_info_column.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'package:music_player_flutter/model/song.dart';

class PlayerPage extends StatelessWidget {

  final Song song;

  const PlayerPage({
    required this.song,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    //functions
    void onBackPressed(BuildContext context) {
      context.go('/');
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => onBackPressed(context),
          icon: const IconRoundedTinted(
            icon: Icons.arrow_back_ios_rounded,
            size: 25,
          ),
        ),
      ),
      body: Stack(
        children: [

          Container(
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
          ),

          //bottom of the screen
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [

                SizedBox(
                  height: 350,
                  width: 350,
                  child: QueryArtworkWidget(
                    id: song.id,
                    type: ArtworkType.AUDIO,
                    //controller: audioQuery,
                  ),
                ),

                const Gap(80.0),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),

                  //song info row
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Consumer<DataModel>(
                        builder: (context, model, child) =>
                          SongInfoColumn(
                            songTitle: song.title,
                            artistName: song.artist ?? '',
                            color: Colors.white,
                            scale: 1.2,
                          ),
                      ),

                      //action buttons
                      Row(
                        children: [
                          Consumer<DataModel>(
                            builder: (context, model, child) =>
                              IconButton(
                                onPressed: () {
                                  model.bookmarkSong(openedSongIndex);
                                },
                                icon: IconRoundedTinted(
                                  icon: song. ? Icons.bookmark_added : Icons.bookmark_outline,
                                  size: 20,
                                ),
                              ),
                          ),

                          const IconButton(
                            onPressed: null,
                            icon: IconRoundedTinted(
                              icon: Icons.more_horiz,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(20.0),

                //music slider
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Consumer<DataModel>(
                    builder: (context, model, child) =>
                      Slider(
                        min: 0,
                        max: getSecondsFromTimeString(model.getSongById(openedSongIndex).maxTime),
                        divisions: getSecondsFromTimeString(model.getSongById(openedSongIndex).maxTime).toInt(),
                        value: getSecondsFromTimeString(model.getSongById(openedSongIndex).currentTime),
                        onChanged: (double newValue) {
                          model.updateCurrentSongTime(openedSongIndex, getTimeStringFromDouble(newValue));
                        },
                      ),
                  ),
                ),

                const Gap(5.0),

                TimeRow(
                  openedSongIndex: openedSongIndex,
                ),

                const Gap(10.0),

                PlayerControlsRow(
                  openedSongIndex: openedSongIndex,
                ),

                const Gap(25.0),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
