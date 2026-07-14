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
import '../security/engine/threat_detection_engine.dart';

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
  // REAL FILE SCAN
  //
  // Performs a real scan using the files selected by
  // the user.
  //
  // Current detection:
  //
  // • Counts every scanned file
  // • Counts executable files
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

    await Future.delayed(
      const Duration(seconds: 2),
    );
//==========================================================
//ANALYSIS FILES
//
//Deligates the analysis of scanned files to the ThreatDetectionEngine.
//==========================================================
final analysis = ThreatDetectionEngine.analyse(files);
    return ScanResult(
      appsScanned: analysis.executableFiles,
      filesChecked: files.length,
      threatsFound: analysis.threats,
      protectionScore: analysis.protectionScore,
      status: analysis.status,
      securityLevel: analysis.securityLevel,
      recommendation: analysis.recommendation,
      scanTime: DateTime.now(),
    );
  }
}