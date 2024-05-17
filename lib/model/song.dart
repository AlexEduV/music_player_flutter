
class Song {

  final String name;
  final String artist;
  final String album;
  final String coverSource;
  final String songTime;

  static const String _assetPath = 'assets/images';

  Song({
    required this.name,
    required this.artist,
    required this.album,
    this.coverSource = '$_assetPath/album_cover_placeholder.png',
    required this.songTime,
  });

}
