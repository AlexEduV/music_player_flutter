import 'package:flutter/material.dart';
import 'package:music_player_flutter/helpers/date_helper.dart';
import 'package:provider/provider.dart';

import 'package:music_player_flutter/model/model.dart';

class TimeRow extends StatelessWidget {

  final int openedSongIndex;

  const TimeRow({
    super.key,
    required this.openedSongIndex,
  });

  @override
  Widget build(BuildContext context) {

    TextStyle timeStyle = TextStyle(color: Colors.grey[200]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<DataModel>(
            builder: (context, model, child) =>
                Text(
                  model.getSongById(openedSongIndex).currentTime,
                  style: timeStyle,
                ),
              ),

          Consumer<DataModel>(
            builder: (context, model, child) =>
              Text(
                getTimeLeftFromCurrentAndMax(
                  model.getSongById(openedSongIndex).currentTime,
                  model.getSongById(openedSongIndex).maxTime,
                ),
                style: timeStyle,
              ),
            ),
        ],
      ),
    );
  }
}
