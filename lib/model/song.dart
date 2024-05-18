
class Song {

  final int id;
  final String name;
  final String artist;
  final String album;
  final String coverSource;
  final String maxTime;
  late String currentTime;

  static const String _assetPath = 'assets/images';

  Song({
    required this.id,
    required this.name,
    required this.artist,
    required this.album,
    required this.maxTime,
    this.currentTime = '0:00',
    this.coverSource = '$_assetPath/album_cover_placeholder.png',
  });

}
