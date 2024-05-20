import 'package:flutter/material.dart';
import 'package:music_player_flutter/pages/bottom_nav_pages/library_page.dart';

import 'package:music_player_flutter/widgets/home_page/bottom_nav_bar_icon.dart';

import 'bottom_nav_pages/dashboard_page.dart';

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
