// ==========================================================
// SENTINEL AI
// File: security_overview_card.dart
//
// Description:
// Displays the main security overview card with
// the protection gauge, status and last scan time.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

import '../widgets/security_gauge.dart';

class SecurityOverviewCard extends StatelessWidget {
  final double score;
  final String status;
  final String lastScan;

  const SecurityOverviewCard({
    super.key,
    required this.score,
    required this.status,
    required this.lastScan,
  });

  Color get statusColor {
    if (score >= 90) return Colors.green;
    if (score >= 70) return Colors.orange;
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
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const Text(
              "Overall Protection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SecurityGauge(
              score: score,
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Divider(),

            const SizedBox(height: 15),

            Row(
              children: [

                const Icon(
                  Icons.history,
                  color: Color(0xFF0B3D91),
                ),

                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Last Scan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      lastScan,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}