
class Song {

  final int id;
  final String title;
  final String artist;
  final String album;
  final String coverSource;
  final String maxTime;
  late String currentTime;
  late bool isPlaying;
  late bool isBookmarked;

  static const String _assetPath = 'assets/images';

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.maxTime,
    this.currentTime = '0:00',
    this.isPlaying = false,
    this.isBookmarked = false,
    this.coverSource = '$_assetPath/album_cover_placeholder.png',
  });

}
