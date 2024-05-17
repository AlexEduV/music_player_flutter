import 'package:flutter/material.dart';

class CoverImageLarge extends StatelessWidget {
  final String coverImageSource;

  const CoverImageLarge({
    required this.coverImageSource,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          image: DecorationImage(
            image: AssetImage(
              coverImageSource,
            ),
          ),
        ),
        height: 280,
        width: 280,
      ),
    );
  }
}
