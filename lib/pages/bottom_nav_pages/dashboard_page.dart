import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/style/color_helper.dart';

import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/widgets/home_page/cover_flow_bottom_section.dart';
import 'package:music_player_flutter/widgets/home_page/page_section.dart';
import 'package:music_player_flutter/widgets/home_page/playlist_list_tile.dart';
import 'package:music_player_flutter/widgets/page_title.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    void openPlaylistDetails(int index) {
      context.goNamed('playlistDetails', extra: index);
    }

    void openPlayer(int index) {
      context.goNamed('player', extra: index);
    }

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
      child: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Gap(30),

            //icons
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //welcome text
                  PageTitle(
                    title: 'Home',
                  ),

                  //profile button
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),

            const Gap(20),

            //trending music section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: PageSection(
                sectionTitle: 'Trending Now',
              ),
            ),

            const Gap(15),

            //cover flow horizontal
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: DataModel.trendingMusic.length,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Stack(
                        children: [

                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  DataModel.trendingMusic[index].coverSource,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          CoverFlowBottomSection(
                            index: index,
                            onTap: () => openPlayer(index + 1),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            const Gap(20),

            //playlist section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: PageSection(
                sectionTitle: 'Playlists',
                onSectionButtonPressed: () {},
              ),
            ),

            //playlist listView expanded
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: ListView.separated(
                  itemCount: DataModel.playlists.length,
                  itemBuilder: (context, index) {
                    return PlaylistListTile(
                      playList: DataModel.playlists[index],
                      onItemTap: () => openPlaylistDetails(index),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(10);
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}