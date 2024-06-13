//static values (ideally to be loaded via async)
import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:music_player_flutter/helpers/date_helper.dart';
import 'package:music_player_flutter/model/play_list.dart';
import 'package:music_player_flutter/model/song.dart';
import 'package:on_audio_query/on_audio_query.dart';

class DataModel with ChangeNotifier {

  static const String _assetPath = 'assets/images';

  static const platform = MethodChannel('ua.kiev.utec.music_player');

  final player = AudioPlayer();
  StreamSubscription? positionSubscription;
  static bool isSearching = false;

  static List<Song> songs = [];
  static List<Song> staticSongs = [

    Song(
      id: 1,
      title: '22',
      artist: 'Taylor Swift',
      album: 'Red',
      coverSource: '$_assetPath/22_album_cover.jpeg',
      maxTime: '4:02',
      source: '',
      isStatic: true,
    ),

    Song(
      id: 2,
      title: 'Bohemian Rhapsody',
      artist: 'Queen',
      album: 'A Night At The Opera',
      coverSource: '$_assetPath/bohemian_rhapsody_album_cover.jpeg',
      maxTime: '6:03',
      source: '',
      isStatic: true,
    ),

    Song(
      id: 3,
      title: 'Fearless',
      artist: 'Taylor Swift',
      album: 'Fearless',
      coverSource: '$_assetPath/fearless_album_cover.png',
      maxTime: '4:03',
      source: '',
      isStatic: true,
    ),

    Song(
      id: 4,
      title: 'No Tears Left To Cry',
      artist: 'Ariana Grande',
      album: 'Sweetener',
      coverSource: '$_assetPath/sweetener_album_cover.png',
      maxTime: '3:26',
      source: '',
      isStatic: true,
    ),
  ];

  final OnAudioQuery audioQuery = OnAudioQuery();
  late bool _hasPermission = false;

  checkAndRequestPermissions({bool retry = false}) async {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    // Only call update the UI if application has all required permissions.
    _hasPermission ? getSongs() : null;
  }

  void getSongs() async {

    // Query Audios
    List<SongModel> all = await audioQuery.querySongs();
    int id = 0;

    //filter just music
    for (final audio in all) {
      if (audio.isMusic ?? false) {

        debugPrint('library data:');
        debugPrint(audio.data);
        debugPrint(audio.uri);

        songs.add(
          Song(
            id: id,
            title: audio.title,
            artist: audio.artist ?? '',
            album: audio.album ?? '',
            maxTime: getTimeStringFromDouble((audio.duration ?? 0.0) / 1000),
            source: audio.uri ?? '',
            isStatic: false,
          )
        );
      }
    }
  }
  
  static Song _getSongById(List<Song> songs, int id) {
    return songs.firstWhere((element) => element.id == id);
  }

  Song getSongById( List<Song> songs, int id) {
    return _getSongById(songs, id);
  }

  static final List<Song> trendingMusic = [
    _getSongById(staticSongs, 1),
    _getSongById(staticSongs, 2),
  ];

  static List<PlayList> playlists = [

    PlayList(
      name: 'Best Pop',
      coverSource: '$_assetPath/taylor_swift_cover_large.jpeg',
      songs: [

        _getSongById(staticSongs, 3),
        _getSongById(staticSongs, 4),
      ],
    ),

    PlayList(
      name: 'Rock',
      songs: [

        _getSongById(staticSongs, 2),

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
  void bookmarkSong(List<Song> songs, int id) {
    getSongById(songs, id).isBookmarked = !getSongById(songs, id).isBookmarked;
    notifyListeners();
  }

  void updateCurrentSongTime(List<Song> songs, int id, String newTime) {
    getSongById(songs, id).currentTime = newTime;
    notifyListeners();
  }

  void playAndPauseSong(List<Song> songs, int id, {String source = ''}) async {

    //update UI
    getSongById(songs, id).isPlaying = !getSongById(songs, id).isPlaying;

    if (getSongById(songs, id).isPlaying) {

      String path = await getSongPathFromUri(source);

      player.setSource(DeviceFileSource(path));

      player.stop();
      player.resume();

      positionSubscription = player.onPositionChanged.listen((duration) {

        if (!isSearching) {
          getSongById(songs, id).currentTime = getTimeStringFromDouble(duration.inSeconds.toDouble());
          debugPrint('currentTime: ${getSongById(songs, id).currentTime}');

          notifyListeners();
        }

      });

    }
    else {
      player.pause();

      positionSubscription?.cancel();
    }

    notifyListeners();

  }

  Future<String> getSongPathFromUri(String uri) async {

    String path = '';

    //get path (absolute) from content uri
    if(Platform.isAndroid) {

      path = await platform.invokeMethod("getPathFromContentURI", <String, String> {
        "contentURI": uri,
      });

    }
    else {
      //TODO: if iOS
    }

    debugPrint('path: $path');

    return path;
  }

  void stopPlayer(List<Song> songs, int id) {

    player.stop();

    getSongById(songs, id).isPlaying = false;
    getSongById(songs, id).currentTime = '0:00';

    positionSubscription?.cancel();
  }

  void seekPosition(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }


}