// ==========================================================
// SENTINEL AI
// File: scan_engine.dart
//
// Description:
// Simulates a cybersecurity scan by generating
// dynamic scan statistics and security analysis.
//
// Author: Ab Junior
// ==========================================================

import 'dart:math';

// ==========================================================
// SCAN RESULT MODEL
//
// Stores all information produced by a completed scan.
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
}

// ==========================================================
// SCAN ENGINE
//
// Simulates scanning a device by generating random
// but realistic cybersecurity results.
// ==========================================================

class ScanEngine {
  static ScanResult performScan() {
    final random = Random();

    final apps = 120 + random.nextInt(81); // 120–200 apps
    final files = 3000 + random.nextInt(4001); // 3000–7000 files
    final threats = random.nextInt(4); // 0–3 threats

    int score = 100 - (threats * 15);

    if (score < 40) {
      score = 40;
    }

    String status;

    if (threats == 0) {
      status = "Your device is secure.";
    } else if (threats == 1) {
      status = "Low-risk threat detected.";
    } else if (threats == 2) {
      status = "Multiple threats detected.";
    } else {
      status = "Critical security attention required.";
    }

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
                ? "Some security improvements are recommended."
                : "Immediate action is required to protect this device.";

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
}