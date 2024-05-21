import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LibraryListTile extends StatelessWidget {
  final int index;
  final String songTitle;
  final String album;
  final String artist;
  final String maxTime;
  final Widget cover;

  const LibraryListTile({
    required this.index,
    required this.songTitle,
    required this.album,
    required this.artist,
    required this.maxTime,
    required this.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onLongPress: () {
          //TODO: Show bottom sheet here:

        },
        onTap: () {
          context.go('player');
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //cover image
              cover,

              const Gap(20.0),

              //song details column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //name text
                    Text(
                      songTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,

                      ),
                    ),

                    // album & time
                    Row(
                      children: [
                        Text(
                          artist,
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
              Text(
                maxTime,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
