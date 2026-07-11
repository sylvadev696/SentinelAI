// ==========================================================
// SENTINEL AI
// File: scan_engine.dart
//
// Description:
// Simulates a cybersecurity scan by generating
// realistic scan statistics and security analysis.
//
// This file contains:
// • ScanResult model
// • ScanResult serialization methods
// • ScanEngine simulation logic
//
// Author: Ab Junior
// ==========================================================

import 'dart:math';

// ==========================================================
// SCAN RESULT MODEL
//
// Stores all information produced by a completed scan.
//
// This model can also be converted to and from a Map
// for permanent storage using SharedPreferences.
// ==========================================================

class ScanResult {
  final int appsScanned;
  final int filesChecked;
  final int threatsFound;
  final int protectionScore;

  final String status;
  final String securityLevel;
  final String recommendation;
  final DateTime scanTime;

  ScanResult({
    required this.appsScanned,
    required this.filesChecked,
    required this.threatsFound,
    required this.protectionScore,
    required this.status,
    required this.securityLevel,
    required this.recommendation,
    required this.scanTime,
  });

  // ==========================================================
  // CONVERT TO MAP
  //
  // Converts this ScanResult into a Map so it can
  // be stored permanently.
  // ==========================================================

  Map<String, dynamic> toMap() {
    return {
      "appsScanned": appsScanned,
      "filesChecked": filesChecked,
      "threatsFound": threatsFound,
      "protectionScore": protectionScore,
      "status": status,
      "securityLevel": securityLevel,
      "recommendation": recommendation,
      "scanTime": scanTime.toIso8601String(),
    };
  }

  // ==========================================================
  // CREATE FROM MAP
  //
  // Reconstructs a ScanResult from stored data.
  // ==========================================================

  factory ScanResult.fromMap(
    Map<String, dynamic> map,
  ) {
    return ScanResult(
      appsScanned: map["appsScanned"] as int,
      filesChecked: map["filesChecked"] as int,
      threatsFound: map["threatsFound"] as int,
      protectionScore: map["protectionScore"] as int,
      status: map["status"] as String,
      securityLevel: map["securityLevel"] as String,
      recommendation: map["recommendation"] as String,
      scanTime: DateTime.parse(
        map["scanTime"] as String,
      ),
    );
  }
}

class ScanEngine {

  // ==========================================================
  // SIMULATED SCAN
  // ==========================================================

  static ScanResult performScan() {
    final random = Random();

    final apps = 120 + random.nextInt(81);
    final files = 3000 + random.nextInt(4001);
    final threats = random.nextInt(4);

    int score = 100 - (threats * 15);

    if (score < 40) score = 40;

    final status = threats == 0
        ? "Your device is secure."
        : threats == 1
            ? "Low-risk threat detected."
            : threats == 2
                ? "Multiple threats detected."
                : "Critical security attention required.";

    final securityLevel = score >= 90
        ? "Excellent"
        : score >= 70
            ? "Good"
            : score >= 50
                ? "Warning"
                : "Critical";

    final recommendation = score >= 90
        ? "Your device is fully protected."
        : score >= 70
            ? "Everything looks good. Keep your apps updated."
            : score >= 50
                ? "Some security improvements are recommended!."
                : "Immediate action is required to protect your device.";

    return ScanResult(
      appsScanned: apps,
      filesChecked: files,
      threatsFound: threats,
      protectionScore: score,
      status: status,
      securityLevel: securityLevel,
      recommendation: recommendation,
      scanTime: DateTime.now(),
    );
  }

  // ==========================================================
  // REAL SCAN
  // ==========================================================

  static Future<ScanResult> performRealScan() async {

    // Temporary:
    // We will replace this with the real scanner next.

    await Future.delayed(const Duration(seconds: 2));

    return performScan();
  }

}