import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaylistDetailsPage extends StatefulWidget {
  const PlaylistDetailsPage({super.key});

  @override
  State<PlaylistDetailsPage> createState() => _PlaylistDetailsPageState();
}

class _PlaylistDetailsPageState extends State<PlaylistDetailsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
            'Playlists',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
        ),
        leading: IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          )
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
        child: const SingleChildScrollView(

        ),
      ),
    );
  }

  void onBackPressed() {
    context.go('/');
  }


}
