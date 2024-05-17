//static values (ideally to be loaded via async)
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/model/song.dart';

const String assetPath = 'assets/images';

final List<Song> trendingMusic = [
  Song(
    name: '22',
    artist: 'Taylor Swift',
    album: 'Red',
    coverSource: '$assetPath/22_album_cover.jpeg',
    songTime: '4:02',
  ),

  Song(
    name: 'Bohemian Rhapsody',
    artist: 'Queen',
    album: 'A Night At The Opera',
    coverSource: '$assetPath/bohemian_rhapsody_album_cover.jpeg',
    songTime: '6:03',
  ),
];

final List<PlayList> playlists = [

  PlayList(
    name: 'Best Pop',
    songs: [

      Song(
        name: 'Fearless',
        artist: 'Taylor Swift',
        album: 'Fearless',
        songTime: '4:03',
      ),

      Song(
        name: 'No Tears Left To Cry',
        artist: 'Ariana Grande',
        album: 'Sweetener',
        songTime: '3:26',
      )
    ],
  ),

  PlayList(
    name: 'Rock',
    songs: [

      Song(
        name: 'Bohemian Rhapsody',
        artist: 'Queen',
        album: 'A Night At The Opera',
        coverSource: '$assetPath/bohemian_rhapsody_album_cover.jpeg',
        songTime: '6:03',
      ),

    ],
  )
];