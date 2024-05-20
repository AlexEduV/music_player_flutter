import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/pages/bottom_nav_pages/library_page.dart';

import 'package:music_player_flutter/widgets/home_page/bottom_nav_bar_icon.dart';
import 'package:music_player_flutter/widgets/home_page/cover_flow_bottom_section.dart';
import 'package:music_player_flutter/widgets/home_page/playlist_list_tile.dart';
import 'package:music_player_flutter/widgets/home_page/page_section.dart';

import 'package:music_player_flutter/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: getBottomNavigationPageByIndex(_selectedBottomNavigationIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavigationIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavigationIndex = index;
          });
        },
        backgroundColor: const Color(0xff462276),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: BottomNavigationBarIcon(
              icon: Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Library',
            icon: BottomNavigationBarIcon(
              icon: Icons.library_music,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bookmarks',
            icon: BottomNavigationBarIcon(
              icon: Icons.bookmark,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: BottomNavigationBarIcon(
              icon: Icons.search,
            ),
          ),
        ],
      ),

    );
  }

  Widget? getBottomNavigationPageByIndex(int index) {

    if (index == 0) {
      return const DashboardPage();
    }
    else if (index == 1) {
      return const LibraryPage();
    }

    return const SizedBox.shrink();

  }
}

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
            Color(0xff462276),
            Color(0xff7A558C),
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
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
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

