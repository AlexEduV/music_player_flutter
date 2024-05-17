import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/widgets/play_button.dart';

class PlaylistListTile extends StatelessWidget {
  final Function() onItemTap;
  final PlayList playList;

  const PlaylistListTile({
    super.key,
    required this.onItemTap,
    required this.playList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff462276).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [

            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(
                    playList.coverSource,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Gap(16.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    playList.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  Text(
                    '${playList.length} Songs',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),

                ],
              ),
            ),

            const Gap(16.0),

            //play/pause button
            PlayButton(
              color: Colors.grey[200]!,
              size: 22,
            ),

          ],
        ),
      ),
    );
  }
}
