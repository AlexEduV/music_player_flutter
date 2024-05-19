import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/helpers/date_helper.dart';
import 'package:music_player_flutter/widgets/icon_rounded_tinted.dart';
import 'package:music_player_flutter/widgets/player_page/player_controls_row.dart';
import 'package:music_player_flutter/widgets/player_page/time_row.dart';
import 'package:music_player_flutter/widgets/song_info_column.dart';

class PlayerPage extends StatelessWidget {

  final int openedSongIndex;

  const PlayerPage({
    required this.openedSongIndex,
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

                Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        openedSong.coverSource,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),

                const Gap(80.0),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),

                  //song info row
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SongInfoColumn(
                        songTitle: openedSong.title,
                        artistName: openedSong.artist,
                        color: Colors.white,
                        scale: 1.2,
                      ),

                      //action buttons
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              model.bookmarkSong(openedSongIndex);
                            },
                            icon: IconRoundedTinted(
                              icon: openedSong.isBookmarked ? Icons.bookmark_added : Icons.bookmark_outline,
                              size: 20,
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
                  child: Slider(
                    min: 0,
                    max: getSecondsFromTimeString(openedSong.maxTime),
                    divisions: getSecondsFromTimeString(openedSong.maxTime).toInt(),
                    value: getSecondsFromTimeString(openedSong.currentTime),
                    onChanged: (double newValue) {
                      model.updateCurrentSongTime(openedSongIndex, getTimeStringFromDouble(newValue));
                    },
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
