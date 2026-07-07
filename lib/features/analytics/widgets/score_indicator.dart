// ==========================================================
// SENTINEL AI
// File: score_indicator.dart
//
// Description:
// Displays the overall security score of the device.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

class ScoreIndicator extends StatelessWidget {

  final int score;
  final String status;

  const ScoreIndicator({
    super.key,
    required this.score,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {

    Color color;

    if (score >= 90) {
      color = Colors.green;
    } else if (score >= 70) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            const Text(
              "Overall Security",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            CircularProgressIndicator(
              value: score / 100,
              strokeWidth: 10,
              color: color,
              backgroundColor: Colors.grey.shade300,
            ),

            const SizedBox(height: 20),

            Text(
              "$score%",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              status,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}