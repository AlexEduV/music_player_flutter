import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/widgets/bottom_sheet_text_tile.dart';
import 'package:music_player_flutter/widgets/playlist_details_page/cover_labeled_large.dart';
import 'package:music_player_flutter/widgets/icon_rounded_tinted.dart';
import 'package:music_player_flutter/widgets/playlist_details_page/song_list_tile.dart';
import 'package:provider/provider.dart';

class PlaylistDetailsPage extends StatelessWidget {

  final int index;

  const PlaylistDetailsPage({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    //initialization
    DataModel model = Provider.of<DataModel>(context);
    PlayList playList = model.getPlaylistById(index);

    //functions
    void onBackPressed(BuildContext context) {
      context.go('/');
    }

    void onMoreButtonPressed(BuildContext context) {
      showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 12.0,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  BottomSheetTile(
                    label: 'Delete from Library',
                    icon: Icons.delete,
                    onPressed: () {

                      //delete playlist from the base
                      model.deletePlaylist(index);

                      //close the modal view
                      ///TODO: Replace this section with context.go('/'),
                      ///but only when other pages support provider;
                      context.pop();

                      //close the page
                      context.replace('/');
                    },
                  ),

                ],
              ),
            );
          });
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
        actions: [
          IconButton(
            onPressed: () {
              model.bookmarkPlaylist(index);
            },
            icon: IconRoundedTinted(
              icon: playList.isBookmarked ? Icons.bookmark_added : Icons.bookmark_outline,
            ),
          ),

          IconButton(
            onPressed: () => onMoreButtonPressed(context),
            icon: const IconRoundedTinted(
              icon: Icons.more_horiz,
            ),
          ),
        ],
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

              //big cover picture centered
              CoverLabeledLarge(
                coverImageSource: playList.songs.first.coverSource,
                label: playList.name,
              ),

              const Gap(30.0),

              //shuffle bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32.0),
                    onTap: () {
                      model.playPlaylist(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Row(
                        children: [

                          //play button
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                //play icon circular
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff7A558C),
                                    borderRadius: BorderRadius.circular(64.0),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),

                                const Gap(10.0),

                                //text play
                                const Text(
                                  'Play',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          //shuffle button
                          Expanded(
                            child: Material(
                              borderRadius: BorderRadius.circular(32.0),
                              color: const Color(0xff6D4A98),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(32.0),
                                onTap: () {
                                  model.shufflePlaylist(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.0),
                                    color: Colors.transparent,
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      //shuffle icon
                                      FaIcon(
                                        FontAwesomeIcons.shuffle,
                                        color: Colors.white,
                                        size: 20,
                                      ),

                                      Gap(10.0),

                                      //shuffle text
                                      Text(
                                        'Shuffle',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ]
                      ),
                    ),
                  ),
                ),
              ),

              const Gap(30),

              //playlist listView
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playList.length,
                    itemBuilder: (context, index) {
                      return SongListTile(
                        index: index,
                        songTitle: playList.songs[index].title,
                        album: playList.songs[index].album,
                        artist: playList.songs[index].artist,
                        maxTime: playList.songs[index].maxTime,
                        coverSource: playList.songs[index].coverSource,
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

}
