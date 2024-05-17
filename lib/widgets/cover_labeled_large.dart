import 'package:flutter/material.dart';

class CoverLabeledLarge extends StatelessWidget {
  final String coverImageSource;
  final String label;

  const CoverLabeledLarge({
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
          bottom: 10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
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
