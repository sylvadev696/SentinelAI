// ==========================================================
// SENTINEL AI
// File: threat_report_screen.dart
//
// Description:
// Displays every threat detected during
// a completed scan.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

import '../models/threat_report.dart';

class ThreatReportScreen extends StatelessWidget {
  final List<ThreatReport> reports;

  const ThreatReportScreen({
    super.key,
    required this.reports,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Threat Report"),
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
      ),

      body: reports.isEmpty
          ? const Center(
              child: Text(
                "No threats detected!.\nYour device is secure!.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: reports.length,

              itemBuilder: (context, index) {

                final threat = reports[index];

                return Card(

                  elevation: 3,

                  margin:
                      const EdgeInsets.only(bottom: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                  ),

                  child: Padding(

                    padding:
                        const EdgeInsets.all(18),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 30,
                            ),

                            const SizedBox(width: 10),

                            Expanded(

                              child: Text(

                                threat.fileName,

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "Reason: ${threat.reason}",
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Severity: ${threat.severity}",
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Path:\n${threat.filePath}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
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