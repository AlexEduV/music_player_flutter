
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/helpers/date_helper.dart';
import 'package:music_player_flutter/widgets/icon_rounded_tinted.dart';
import 'package:music_player_flutter/widgets/player_control_button.dart';
import 'package:music_player_flutter/widgets/song_info_column.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../model/song.dart';

class PlayerPage extends StatelessWidget {

  final int songIndex;

  const PlayerPage({
    required this.songIndex,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    //init model
    DataModel model = Provider.of<DataModel>(context);
    Song openedSong = model.getSongById(songIndex);

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
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //half of the screen
              Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      openedSong.coverSource,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              //bottom of the screen
              Padding(
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
                            model.bookmarkSong(songIndex);
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Slider(
                  min: 0,
                  max: getSecondsFromTimeString(openedSong.maxTime),
                  divisions: getSecondsFromTimeString(openedSong.maxTime).toInt(),
                  value: getSecondsFromTimeString(openedSong.currentTime),
                  onChanged: (double newValue) {
                    model.updateCurrentSongTime(songIndex, getTimeStringFromDouble(newValue));
                  },
                ),
              ),

              const Gap(5.0),

              //time texts
              Padding(
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
              ),

              //song controls
              const Gap(10.0),
              
              Padding(
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
                    )

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
