import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayerPage extends StatelessWidget {

  final int songIndex;

  const PlayerPage({
    required this.songIndex,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    //functions
    void onBackPressed(BuildContext context) {
      context.go('/');
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => onBackPressed(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
    );
  }
}
