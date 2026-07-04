// ==========================================================
// SENTINEL AI
// File: scan_report_card.dart
//
// Description:
// Displays a professional scan report after a device scan.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';
import '../scan_engine.dart';

class ScanReportCard extends StatelessWidget {
  final ScanResult scanResult;

  const ScanReportCard({
    super.key,
    required this.scanResult,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "📋 Scan Report",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(height: 30),

            _infoRow(
              Icons.apps,
              "Apps Scanned",
              scanResult.appsScanned.toString(),
            ),

            _infoRow(
              Icons.folder,
              "Files Checked",
              scanResult.filesChecked.toString(),
            ),

            _infoRow(
              Icons.warning_amber_rounded,
              "Threats Found",
              scanResult.threatsFound.toString(),
            ),

            const SizedBox(height: 15),

            Text(
              "Protection Score: ${scanResult.protectionScore}%",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: scanResult.protectionScore >= 90
                    ? Colors.green
                    : scanResult.protectionScore >= 70
                        ? Colors.orange
                        : Colors.red,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              scanResult.status,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [

          Icon(icon, color: Colors.blue),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}