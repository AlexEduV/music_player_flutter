import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:music_player_flutter/widgets/bottom_nav_bar_icon.dart';
import 'package:music_player_flutter/widgets/cover_flow_bottom_section.dart';
import 'package:music_player_flutter/widgets/playlist_list_tile.dart';
import 'package:music_player_flutter/widgets/page_section.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Gap(30),

              //icons
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //browse button
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.grid_view_rounded,
                        size: 30,
                        color: Colors.white,
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

              const Gap(40),

              //texts
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const Gap(5),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Enjoy Your Favorite Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              const Gap(30),

              //search bar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: SearchBar(
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search in the Library',
                  hintStyle: MaterialStatePropertyAll(
                    TextStyle(color: Colors.grey),
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20),
                  ),
                  shadowColor: MaterialStatePropertyAll(Colors.transparent),

                ),
              ),

              const Gap(30),

              //trending music section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: PageSection(
                  sectionTitle: 'Trending Music',
                ),
              ),

              const Gap(15),

              //cover flow horizontal
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingMusic.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [

                            Container(
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                    trendingMusic[index].coverSource,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            CoverFlowBottomSection(
                              index: index,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: PageSection(
                  sectionTitle: 'Playlists',
                ),
              ),

              //playlist listView expanded
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  child: ListView.separated(
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return PlaylistListTile(
                        playList: playlists[index],
                        onItemTap: openPlaylistDetails,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(20);
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavigationIndex,
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
            label: 'Bookmarks',
            icon: BottomNavigationBarIcon(
              icon: Icons.bookmark,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Play',
            icon: BottomNavigationBarIcon(
              icon: Icons.play_circle,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: BottomNavigationBarIcon(
              icon: Icons.people,
            ),
          ),
        ],
      ),

    );
  }

  void openPlaylistDetails() {
    context.go('/playlistDetails');
  }
}
