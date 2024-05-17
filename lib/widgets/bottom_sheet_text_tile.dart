import 'package:flutter/material.dart';

class BottomSheetTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function()? onPressed;

  const BottomSheetTile({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xff462276),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
