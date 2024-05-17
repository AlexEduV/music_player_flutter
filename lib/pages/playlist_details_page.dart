import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_flutter/model/play_list.dart';

class PlaylistDetailsPage extends StatefulWidget {

  final PlayList playlist;

  const PlaylistDetailsPage({
    required this.playlist,
    super.key,
  });

  @override
  State<PlaylistDetailsPage> createState() => _PlaylistDetailsPageState();
}

class _PlaylistDetailsPageState extends State<PlaylistDetailsPage> {

  late PlayList playList;

  @override
  void initState() {
    super.initState();

    playList = widget.playlist;
  }

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
            mainAxisSize: MainAxisSize.min,
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
              Text(
                playList.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

              const Gap(30.0),

              //shuffle bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //play button
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

                    //shuffle button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: const Color(0xff6D4A98),
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

              const Gap(30),

              //playlist listView
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          //counter text
                          Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),

                          const Gap(20.0),

                          //song details column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                //name text
                                Text(
                                  playList.songs[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,

                                  ),
                                ),

                                // album & time
                                Row(
                                  children: [
                                    Text(
                                      playList.songs[index].album,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const Gap(6.0),

                                    //a dot
                                    const Text('\u2022', style: TextStyle(color: Colors.white),),

                                    const Gap(6.0),

                                    //song duration
                                    Text(
                                      playList.songs[index].songTime,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),


                                  ],
                                )
                              ],
                            ),
                          ),

                          const Gap(20.0),

                          //more button
                          const IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          )


                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(20);
                    },
                  ),
                ),
              )

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
