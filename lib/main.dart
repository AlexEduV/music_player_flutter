
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/pages/home_page.dart';
import 'package:music_player_flutter/pages/playlist_details_page.dart';

void main() {
  runApp(const MyApp());
}

//go router configuration
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'playlistDetails',
          builder: (BuildContext context, GoRouterState state) {
            return const PlaylistDetailsPage();
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