
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/widgets/icon_rounded_tinted.dart';
import 'package:music_player_flutter/widgets/song_info_column.dart';

class PlayerPage extends StatelessWidget {

  final int songIndex;

  const PlayerPage({
    required this.songIndex,
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
          icon: const Icon(Icons.arrow_back_ios_rounded),
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
        child: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //half of the screen
              SizedBox(
                width: double.maxFinite,
                height: 300,
              ),

              //bottom of the screen
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),

                //song info row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SongInfoColumn(
                      songTitle: 'Song Title',
                      artistName: 'Artist',
                      color: Colors.white,
                      scale: 1.2,
                    ),

                    //action buttons
                    Row(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: IconRoundedTinted(icon: Icons.bookmark_outline),
                        ),

                        IconButton(
                          onPressed: null,
                          icon: IconRoundedTinted(icon: Icons.more_horiz),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Gap(10.0),

              //music slider
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Slider(
                  
                  value: 0,
                  onChanged: null,
                ),
              ),
              //time texts

              //song controls
            ],
          ),
        ),
      ),
    );
  }
}
