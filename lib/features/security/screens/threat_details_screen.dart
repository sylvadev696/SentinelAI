// ==========================================================
// SENTINEL AI
// File: threat_details_screen.dart
//
// Description:
// Displays every detected threat together with
// its SHA-256 fingerprint.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

import '../models/threat_report.dart';

class ThreatDetailsScreen extends StatelessWidget {
  final List<ThreatReport> reports;

  const ThreatDetailsScreen({
    super.key,
    required this.reports,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Threat Details"),
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,

        itemBuilder: (context, index) {

          final report = reports[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    report.fileName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text("Reason: ${report.reason}"),

                  const SizedBox(height: 8),

                  Text("Severity: ${report.severity}"),

                  const SizedBox(height: 12),

                  const Text(
                    "SHA-256",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  SelectableText(
                    report.sha256,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}