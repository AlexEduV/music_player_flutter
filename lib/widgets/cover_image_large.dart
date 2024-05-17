import 'package:flutter/material.dart';

class CoverImageLarge extends StatelessWidget {
  final String coverImageSource;
  final String label;

  const CoverImageLarge({
    required this.coverImageSource,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                coverImageSource,
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 320,
        ),

        //playlist title
        Positioned(
          bottom: 20,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
