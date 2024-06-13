import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../model/song.dart';

class LibraryListTile extends StatelessWidget {
  final Song song;
  final Widget cover;

  const LibraryListTile({
    required this.song,
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
          context.goNamed('player', extra: song);
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
                      song.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,

                      ),
                    ),

                    // album & time
                    Row(
                      children: [
                        Text(
                          song.artist,
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
                song.maxTime,
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
