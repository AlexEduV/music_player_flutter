
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/model/model.dart';
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/pages/home_page.dart';
import 'package:music_player_flutter/pages/player_page.dart';
import 'package:music_player_flutter/pages/playlist_details_page.dart';
import 'package:provider/provider.dart';

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

            return const PlayerPage();

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
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Music Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}