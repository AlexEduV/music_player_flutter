import 'package:flutter/cupertino.dart';

class Album {
  final int id;
  final String title;
  final int year;
  final Widget cover;

  Album({
    required this.id,
    required this.title,
    required this.year,
    required this.cover,
  });
  
}