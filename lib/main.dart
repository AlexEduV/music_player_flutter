import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/style/color_helper.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/pages/home_page.dart';
import 'package:music_player_flutter/pages/player_page.dart';
import 'package:music_player_flutter/pages/playlist_details_page.dart';
import 'package:provider/provider.dart';

import 'model/song.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: const MyApp(),
    )
  );
}

//go router configuration
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'root',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'playlistDetails',
          name: 'playlistDetails',
          builder: (BuildContext context, GoRouterState state) {
            int index = state.extra as int;

            return PlaylistDetailsPage(
              index: index,
            );
          },
        ),

        GoRoute(
          path: 'player',
          name: 'player',
          builder: (BuildContext context, GoRouterState state) {
            Song song = state.extra as Song;

            return PlayerPage(
              song: song,
            );

          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Music Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorHelper.mainColor),
        useMaterial3: true,
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.grey[400],
          thumbColor: Colors.white,
          trackHeight: 7,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}