import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        child: SingleChildScrollView(

          child: Column(
            children: [

              //big cover picture centered
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.grey,
                  ),
                  height: 280,
                  width: 280,
                ),
              ),

              const Gap(25.0),

              //playlist title
              const Text(
                'Hip-hop R&B Mix',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

              const Gap(30.0),

              //shuffling bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 56.0),
                      child: Row(
                        children: [

                          //text play
                          const Text(
                            'Play',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const Gap(10.0),

                          //play icon circular
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xff7A558C),
                              borderRadius: BorderRadius.circular(64.0),
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),

                        ],
                      ),
                    ),

                    //shuffle
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: const Color(0xff73489D),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 36.0),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          //shuffle text
                          Text(
                            'Shuffle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Gap(15.0),

                          //shuffle icon
                          Icon(
                            Icons.shuffle_outlined,
                            color: Colors.white,
                            size: 20,
                          ),

                        ],
                      ),
                    ),

                  ]
                ),
              ),

              //playlist listView

            ],
          )
        ),
      ),
    );
  }

  void onBackPressed() {
    context.go('/');
  }


}
