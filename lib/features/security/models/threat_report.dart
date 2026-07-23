// ==========================================================
// SENTINEL AI
// File: threat_report.dart
//
// Description:
// Represents one detected threat during a scan.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/foundation.dart';

@immutable
class ThreatReport {

  // ==========================================================
  // FILE DETAILS
  // ==========================================================

  final String fileName;

  final String filePath;

  // ==========================================================
  // THREAT DETAILS
  // ==========================================================

  final String reason;

  final String severity;

  final String sha256;

  // ==========================================================
  // CONSTRUCTOR
  // ==========================================================

  const ThreatReport({
    required this.fileName,
    required this.filePath,
    required this.reason,
    required this.severity,
    required this.sha256,
  });

  // ==========================================================
  // CONVERT TO MAP
  // ==========================================================

  Map<String, dynamic> toMap() {
    return {
      "fileName": fileName,
      "filePath": filePath,
      "reason": reason,
      "severity": severity,
      "sha256": sha256,
    };
  }

  // ==========================================================
  // CREATE FROM MAP
  // ==========================================================

  factory ThreatReport.fromMap(
    Map<String, dynamic> map,
  ) {
    return ThreatReport(
      fileName: map["fileName"] as String,
      filePath: map["filePath"] as String,
      reason: map["reason"] as String,
      severity: map["severity"] as String,
      sha256: map["sha256"] ?? "",
    );
  }
}