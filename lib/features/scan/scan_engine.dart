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


import '../security/models/file_information.dart';

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

 // ==========================================================
// REAL FILE SCAN
//
// Performs a real scan using the files selected by
// the user.
//
// Current detection:
//
// • Counts every scanned file
// • Detects executable files
// • Detects suspicious filenames
//
// Future improvements:
//
// • SHA-256 hashing
// • Malware signature database
// • AI threat classification
// • Ransomware detection
// • Cloud reputation lookup
// ==========================================================

static Future<ScanResult> performRealScan(
  List<FileInformation> files,
) async {

  // ========================================================
  // THREAT COUNTER
  //
  // Counts how many suspicious files are found.
  // ========================================================

  int threats = 0;

  // ========================================================
  // ANALYZE EVERY FILE
  // ========================================================

  for (final file in files) {

    final name = file.fileName.toLowerCase();

    // ======================================================
    // SIMPLE THREAT DETECTION
    //
    // Detect executable files and suspicious filenames.
    //
    // This is temporary until the AI engine is developed.
    // ======================================================

    if (name.endsWith(".apk") ||
        name.endsWith(".exe") ||
        name.contains("virus") ||
        name.contains("hack") ||
        name.contains("trojan")) {

      threats++;
    }
  }

  // ========================================================
  // CALCULATE PROTECTION SCORE
  // ========================================================

  int score = 100 - (threats * 15);

  if (score < 40) {
    score = 40;
  }

  // ========================================================
  // GENERATE SECURITY STATUS
  // ========================================================

  final status = threats == 0
      ? "Your selected folder is secure."
      : threats == 1
          ? "1 suspicious file detected."
          : "$threats suspicious files detected.";

  // ========================================================
  // DETERMINE SECURITY LEVEL
  // ========================================================

  final securityLevel = score >= 90
      ? "Excellent"
      : score >= 70
          ? "Good"
          : score >= 50
              ? "Warning"
              : "Critical";

  // ========================================================
  // GENERATE SECURITY RECOMMENDATION
  // ========================================================

  final recommendation = threats == 0
      ? "No suspicious files were found."
      : "Review or remove suspicious files.";

  // ========================================================
  // RETURN COMPLETED SCAN RESULT
  // ========================================================

  return ScanResult(
    appsScanned: 0,
    filesChecked: files.length,
    threatsFound: threats,
    protectionScore: score,
    status: status,
    securityLevel: securityLevel,
    recommendation: recommendation,
    scanTime: DateTime.now(),
  );
}
}