// ==========================================================
// SENTINEL AI
// File: metric_card.dart
//
// Description:
// Enterprise Metric Card v2
// Used in the Security Analytics dashboard.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const MetricCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  String get description {
    switch (title) {
      case "Threats":
        return "Detected";

      case "Applications":
      case "Apps":
        return "Protected";

      case "Files":
        return "Checked";

      case "Risk":
        return "Security Status";

      default:
        return "....";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ==================================================
            // HEADER
            // ==================================================

            Row(
              children: [

                CircleAvatar(
                  radius: 20,
                  backgroundColor: color.withValues(alpha: .12),
                  child: Icon(
                    icon,
                    color: color,
                    size: 22,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ==================================================
            // VALUE
            // ==================================================

            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}