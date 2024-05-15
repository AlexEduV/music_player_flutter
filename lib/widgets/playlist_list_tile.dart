import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_player_flutter/widgets/play_button.dart';

class PlaylistListTile extends StatelessWidget {
  final Function() onItemTap;

  const PlaylistListTile({
    super.key,
    required this.onItemTap,
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
                color: Colors.grey,
              ),
            ),

            const Gap(16.0),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Hip-Hop R&B Mix',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  Text(
                    '30 Songs',
                    style: TextStyle(
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
