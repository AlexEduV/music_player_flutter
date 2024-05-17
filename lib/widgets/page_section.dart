
import 'package:flutter/material.dart';

class PageSection extends StatelessWidget {

  final String sectionTitle;
  final String sectionButtonTitle;
  final Function()? onSectionButtonPressed;

  const PageSection({
    required this.sectionTitle,
    this.onSectionButtonPressed,
    this.sectionButtonTitle = 'View More',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          sectionTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),

        Visibility(
          visible: onSectionButtonPressed != null,
          child: TextButton(
            onPressed: onSectionButtonPressed,
            child: Text(
              sectionButtonTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
