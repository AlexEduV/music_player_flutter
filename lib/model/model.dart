//static values (ideally to be loaded via async)
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/model/song.dart';

const String assetPath = 'assets/images';

final List<Song> trendingMusic = [
  Song(
    name: '22',
    artist: 'Taylor Swift',
    coverSource: '$assetPath/22_album_cover.jpeg',
    songTime: '4:02',
  ),

  Song(
    name: 'Bohemian Rhapsody',
    artist: 'Queen',
    coverSource: '$assetPath/bohemian_rhapsody_album_cover.jpeg',
    songTime: '6:03',
  ),
];

final List<PlayList> playlists = [
  PlayList(
    songs: songs,
    name: name,
    playListCoverSource: playListCoverSource,
  ),
];