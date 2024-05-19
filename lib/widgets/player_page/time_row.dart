import 'package:flutter/material.dart';

class TimeRow extends StatelessWidget {

  final String currentTime;
  final String maxTime;

  const TimeRow({
    super.key,
    required this.currentTime,
    required this.maxTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currentTime,
            style: TextStyle(color: Colors.grey[200]),
          ),

          Text(
            maxTime,
            style: TextStyle(color: Colors.grey[200]),
          ),
        ],
      ),
    );
  }
}
