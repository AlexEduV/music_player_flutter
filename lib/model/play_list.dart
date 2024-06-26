import 'package:music_player_flutter/model/song.dart';

class PlayList {

  final String name;
  final String coverSource;
  final List<Song> songs;
  late bool isBookmarked;

  static const String _assetPath = 'assets/images';

  get length => songs.length;

  PlayList({
    required this.name,
    required this.songs,
    this.coverSource = '$_assetPath/album_cover_placeholder.png',
    this.isBookmarked = false,
  });

}
