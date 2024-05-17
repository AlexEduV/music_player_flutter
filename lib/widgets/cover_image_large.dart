import 'package:flutter/material.dart';

class CoverImageLarge extends StatelessWidget {
  final String coverImageSource;

  const CoverImageLarge({
    required this.coverImageSource,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            coverImageSource,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: 320,
    );
  }
}
