//static values (ideally to be loaded via async)
import 'package:flutter/cupertino.dart';
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/model/song.dart';

class DataModel with ChangeNotifier {

  static const String _assetPath = 'assets/images';
  
  static final List<Song> songs = [
    
    Song(
      id: 1,
      name: '22',
      artist: 'Taylor Swift',
      album: 'Red',
      coverSource: '$_assetPath/22_album_cover.jpeg',
      maxTime: '4:02',
    ),

    Song(
      id: 2,
      name: 'Bohemian Rhapsody',
      artist: 'Queen',
      album: 'A Night At The Opera',
      coverSource: '$_assetPath/bohemian_rhapsody_album_cover.jpeg',
      maxTime: '6:03',
    ),

    Song(
      id: 3,
      name: 'Fearless',
      artist: 'Taylor Swift',
      album: 'Fearless',
      coverSource: '$_assetPath/fearless_album_cover.png',
      maxTime: '4:03',
    ),

    Song(
      id: 4,
      name: 'No Tears Left To Cry',
      artist: 'Ariana Grande',
      album: 'Sweetener',
      coverSource: '$_assetPath/sweetener_album_cover.png',
      maxTime: '3:26',
    ),
    
  ];
  
  static Song getSongById(int id) {
    
    return songs.firstWhere((element) => element.id == id);
  }

  static final List<Song> trendingMusic = [
    getSongById(1),
    getSongById(2),
  ];

  static List<PlayList> playlists = [

    PlayList(
      name: 'Best Pop',
      coverSource: '$_assetPath/taylor_swift_cover_large.jpeg',
      songs: [

        getSongById(3),
        getSongById(4),
      ],
    ),

    PlayList(
      name: 'Rock',
      songs: [

        getSongById(2),

      ],
    ),
  ];

  void bookmarkPlaylist(int id) {
    playlists[id].isBookmarked = !playlists[id].isBookmarked;
    notifyListeners();
  }

  void deletePlaylist(int id) {
    playlists.removeAt(id);
    notifyListeners();
  }

  PlayList getPlaylistById(int id) {
    return playlists[id];
  }

  void shufflePlaylist(int id) {
    playlists[id].songs.shuffle();
    notifyListeners();
  }

  void playPlaylist(int id) {
    //TODO: playing code here:
  }


}