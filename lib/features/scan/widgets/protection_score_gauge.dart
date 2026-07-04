// ==========================================================
// SENTINEL AI
// File: protection_score_gauge.dart
//
// Description:
// Displays a circular protection score indicator that changes
// color based on the device's protection level.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

class ProtectionScoreGauge extends StatelessWidget {
  final int score;

  const ProtectionScoreGauge({
    super.key,
    required this.score,
  });

  // Returns a color based on the protection score.
  Color get scoreColor {
    if (score >= 90) {
      return Colors.green;
    } else if (score >= 70) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Stack(
          alignment: Alignment.center,
          children: [

            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: score / 100,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(scoreColor),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Icon(
                  Icons.shield,
                  size: 28,
                ),

                Text(
                  "$score%",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 15),

        Text(
          score >= 90
              ? "Excellent Protection"
              : score >= 70
                  ? "Moderate Protection"
                  : "Low Protection",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: scoreColor,
          ),
        ),
      ],
    );
  }
}