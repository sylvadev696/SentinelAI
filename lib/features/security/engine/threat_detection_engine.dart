// ==========================================================
// SENTINEL AI
// File: threat_detection_engine.dart
//
// Description:
// Analyses scanned files and generates
// security statistics.
//
// Author: Ab Junior
// ==========================================================

import '../models/file_information.dart';
import '../models/threat_report.dart';

class ThreatDetectionResult {
  final int threats;
  final int executableFiles;
  final int protectionScore;

  final String securityLevel;
  final String status;
  final String recommendation;
  
  final List<ThreatReport> threatReports;

  const ThreatDetectionResult({
    required this.threats,
    required this.executableFiles,
    required this.protectionScore,
    required this.securityLevel,
    required this.status,
    required this.recommendation,
    required this.threatReports,
  });
}

class ThreatDetectionEngine {
  static ThreatDetectionResult analyse(
    List<FileInformation> files,
  ) {
    int threats = 0;
    int executableFiles = 0;
    final List<ThreatReport> reports = [];

    for (final file in files) {
      final name = file.fileName.toLowerCase();

      if (file.isExecutable) {
        executableFiles++;
      }

    String? reason;

if (file.isExecutable) {
  reason = "Executable file";
}

if (name.contains("virus")) {
  reason = "Suspicious filename (virus)";
}

if (name.contains("trojan")) {
  reason = "Suspicious filename (trojan)";
}

if (name.contains("hack")) {
  reason = "Suspicious filename (hack)";
}

if (name.contains("malware")) {
  reason = "Suspicious filename (malware)";
}

if (reason != null) {

  threats++;

  reports.add(
    ThreatReport(
      fileName: file.fileName,
      filePath: file.filePath,
      reason: reason,
      severity: "Medium",
    ),
  );
}  
    }

    int score = 100 - (threats * 10);

    if (score < 40) {
      score = 40;
    }

    final securityLevel = score >= 90
        ? "Excellent"
        : score >= 70
            ? "Good"
            : score >= 50
                ? "Warning"
                : "Critical";

    final status = threats == 0
        ? "Your device is secure."
        : threats == 1
            ? "Low-risk threat detected."
            : threats <= 5
                ? "Multiple threats detected."
                : "Critical security attention required.";

    final recommendation = score >= 90
        ? "Your device is fully protected."
        : score >= 70
            ? "Everything looks good. Keep your apps updated."
            : score >= 50
                ? "Some security improvements are recommended."
                : "Immediate action is required to protect your device.";

    return ThreatDetectionResult(
      threats: threats,
      executableFiles: executableFiles,
      protectionScore: score,
      securityLevel: securityLevel,
      status: status,
      recommendation: recommendation,
      threatReports: reports,
    );
  }
}