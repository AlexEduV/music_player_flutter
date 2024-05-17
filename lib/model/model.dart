//static values (ideally to be loaded via async)
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/model/song.dart';

class DataModel {

  static const String _assetPath = 'assets/images';

  static final List<Song> trendingMusic = [
    Song(
      name: '22',
      artist: 'Taylor Swift',
      album: 'Red',
      coverSource: '$_assetPath/22_album_cover.jpeg',
      songTime: '4:02',
    ),

    Song(
      name: 'Bohemian Rhapsody',
      artist: 'Queen',
      album: 'A Night At The Opera',
      coverSource: '$_assetPath/bohemian_rhapsody_album_cover.jpeg',
      songTime: '6:03',
    ),
  ];

  static List<PlayList> playlists = [

    PlayList(
      name: 'Best Pop',
      coverSource: '$_assetPath/taylor_swift_cover_large.jpeg',
      songs: [

        Song(
          name: 'Fearless',
          artist: 'Taylor Swift',
          album: 'Fearless',
          coverSource: '$_assetPath/fearless_album_cover.png',
          songTime: '4:03',
        ),

        Song(
          name: 'No Tears Left To Cry',
          artist: 'Ariana Grande',
          album: 'Sweetener',
          coverSource: '$_assetPath/sweetener_album_cover.png',
          songTime: '3:26',
        ),
      ],
    ),

    PlayList(
      name: 'Rock',
      songs: [

        Song(
          name: 'Bohemian Rhapsody',
          artist: 'Queen',
          album: 'A Night At The Opera',
          coverSource: '$_assetPath/bohemian_rhapsody_album_cover.jpeg',
          songTime: '6:03',
        ),

      ],
    )
  ];
}