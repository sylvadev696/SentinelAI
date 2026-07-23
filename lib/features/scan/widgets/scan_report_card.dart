// ==========================================================
// SENTINEL AI
// File: scan_report_card.dart
//
// Description:
// Displays a professional scan report after a device scan.
//
// Author: Ab Junior
// ==========================================================
import 'protection_score_gauge.dart';
import 'package:flutter/material.dart';
import '../scan_engine.dart';
import '../../security/screens/threat_details_screen.dart'; 

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

            const SizedBox(height: 15),

Center(
  child: ProtectionScoreGauge(
    score: scanResult.protectionScore,
  ),
),

const SizedBox(height: 20),
            

            const SizedBox(height: 15),

          Text(
                          
              scanResult.status,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            ListTile(
              leading: const Icon(Icons.verified_user, color: Colors.blue),
              title: const Text("Security Level"),
              subtitle: Text(scanResult.securityLevel),
            ),

            ListTile(
              leading: const Icon(Icons.lightbulb_outline, color: Colors.orange),
              title: const Text("Recommendation"),
              subtitle: Text(scanResult.recommendation),
            ),

            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.green),
              title: const Text("Last Scan"),
              subtitle: Text(scanResult.scanTime.toString()),
            ),
            if (scanResult.threatsFound > 0) ...[
  const SizedBox(height: 20),

  SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      icon: const Icon(Icons.security),
      label: const Text("View Threat Details"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ThreatDetailsScreen(
              reports: scanResult.reports,
            ),
          ),
        );
      },
    ),
  ),
],
              
      
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