
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_player_flutter/widgets/bottom_nav_bar_icon.dart';
import 'package:music_player_flutter/widgets/play_button.dart';
import 'package:music_player_flutter/widgets/playlist_list_tile.dart';
import 'package:music_player_flutter/widgets/section_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Music Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.grid_view,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),

                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.supervised_user_circle_outlined,
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
                  hintText: 'Search',
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
                child: SectionRow(
                  sectionTitle: 'Trending Music',
                ),
              ),

              const Gap(20),

              //cover flow horizontal
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  height: 240,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {

                      return Stack(
                        children: [

                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.grey[800],
                            ),
                          ),

                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                color: Colors.white70,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  //song details
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Runaway',
                                        style: TextStyle(
                                          color: Color(0xff462276),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),

                                      Text(
                                        'Aurora',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),

                                  //play/pause button
                                  PlayButton(
                                    tintColor: Colors.grey[200]!,
                                    backgroundColor: const Color(0xff462276),
                                    size: 20,
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(25);
                    },
                  ),
                ),
              ),

              const Gap(20),

              //playlist section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: SectionRow(
                  sectionTitle: 'Playlists',
                ),
              ),

              //playlist listView expanded
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return const PlaylistListTile();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(20);
                    },
                    itemCount: 4,
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: BottomNavigationBarIcon(
              icon: Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bookmarks',
            icon: BottomNavigationBarIcon(
              icon: Icons.bookmark_outline,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Play',
            icon: BottomNavigationBarIcon(
              icon: Icons.play_circle_outline,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: BottomNavigationBarIcon(
              icon: Icons.people_outline,
            ),
          ),
        ],
      ),

    );
  }
}
