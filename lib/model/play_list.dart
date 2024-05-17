import 'package:music_player_flutter/model/song.dart';

class PlayList {

  final List<Song> songs;
  final String name;
  final String playListCoverSource;

  get length => songs.length;

  PlayList({
    required this.songs,
    required this.name,
    required this.playListCoverSource,
  });

}
