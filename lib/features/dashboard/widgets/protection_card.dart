// ==========================================================
// SENTINEL AI
// File: protection_card.dart
//
// Description:
// Enterprise protection card displayed on the
// Dashboard Security Command Center.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

class ProtectionCard extends StatelessWidget {
  final int protectionScore;
  final String securityLevel;
  final String recommendation;

  const ProtectionCard({
    super.key,
    required this.protectionScore,
    required this.securityLevel,
    required this.recommendation,
  });

  Color get statusColor {
    if (protectionScore >= 90) {
      return Colors.green;
    } else if (protectionScore >= 70) {
      return Colors.orange;
    }

    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                CircleAvatar(
                  radius: 28,
                  backgroundColor: statusColor.withValues(alpha: .15),
                  child: Icon(
                    Icons.verified_user,
                    color: statusColor,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 15),

                const Expanded(
                  child: Text(
                    "Device Secure",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Text(
              "$protectionScore%",
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              securityLevel,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 15),

            const Text(
              "AI Recommendation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              recommendation,
              style: const TextStyle(
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}