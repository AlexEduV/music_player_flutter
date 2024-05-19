//static values (ideally to be loaded via async)
import 'package:flutter/cupertino.dart';
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/model/song.dart';

class DataModel with ChangeNotifier {

  static const String _assetPath = 'assets/images';
  
  static final List<Song> songs = [
    
    Song(
      id: 1,
      title: '22',
      artist: 'Taylor Swift',
      album: 'Red',
      coverSource: '$_assetPath/22_album_cover.jpeg',
      maxTime: '4:02',
    ),

    Song(
      id: 2,
      title: 'Bohemian Rhapsody',
      artist: 'Queen',
      album: 'A Night At The Opera',
      coverSource: '$_assetPath/bohemian_rhapsody_album_cover.jpeg',
      maxTime: '6:03',
    ),

    Song(
      id: 3,
      title: 'Fearless',
      artist: 'Taylor Swift',
      album: 'Fearless',
      coverSource: '$_assetPath/fearless_album_cover.png',
      maxTime: '4:03',
    ),

    Song(
      id: 4,
      title: 'No Tears Left To Cry',
      artist: 'Ariana Grande',
      album: 'Sweetener',
      coverSource: '$_assetPath/sweetener_album_cover.png',
      maxTime: '3:26',
    ),
    
  ];
  
  static Song _getSongById(int id) {
    return songs.firstWhere((element) => element.id == id);
  }

  Song getSongById(int id) {
    return _getSongById(id);
  }

  static final List<Song> trendingMusic = [
    _getSongById(1),
    _getSongById(2),
  ];

  static List<PlayList> playlists = [

    PlayList(
      name: 'Best Pop',
      coverSource: '$_assetPath/taylor_swift_cover_large.jpeg',
      songs: [

        _getSongById(3),
        _getSongById(4),
      ],
    ),

    PlayList(
      name: 'Rock',
      songs: [

        _getSongById(2),

      ],
    ),
  ];

  //playlist control code:
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

  //song control code:
  void bookmarkSong(int id) {
    songs[id - 1].isBookmarked = !songs[id - 1].isBookmarked;
    notifyListeners();
  }


}