import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SongListTile extends StatelessWidget {
  final int index;
  final String songTitle;
  final String album;
  final String artist;
  final String time;

  const SongListTile({
    required this.index,
    required this.songTitle,
    required this.album,
    required this.artist,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),


      ],
    );
  }
}
