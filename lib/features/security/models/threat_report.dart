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

  const ThreatReport({

    required this.fileName,

    required this.filePath,

    required this.reason,

    required this.severity,
  });
}