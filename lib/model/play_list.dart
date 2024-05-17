import 'package:music_player_flutter/model/song.dart';

class PlayList {

  final String name;
  final String playListCoverSource;
  final List<Song> songs;

  static const String _assetPath = 'assets/images';

  get length => songs.length;

  PlayList({
    required this.name,
    this.playListCoverSource = '$_assetPath/album_cover_placeholder.png',
    required this.songs,
  });

}
