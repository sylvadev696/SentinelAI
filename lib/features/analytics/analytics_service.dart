// ==========================================================
// SENTINEL AI
// File: analytics_service.dart
//
// Description:
// Generates enterprise security analytics from
// the user's scan history.
//
// Uses ActivityStorageService instead of the old
// in-memory LatestScanService.
//
// Author: Ab Junior
// ==========================================================

import '../../services/activity_storage_service.dart';
import '../scan/scan_engine.dart';
import 'analytics_model.dart';

class AnalyticsService {
  // ==========================================================
  // GENERATE ANALYTICS
  // ==========================================================

  static Future<AnalyticsModel> generateAnalytics() async {
    // Load saved scan history.
    final List<ScanResult> history =
    await ActivityStorageService.loadScans();

    // No scans performed yet.
    if (history.isEmpty) {
      return const AnalyticsModel(
        protectionScore: 0,
        totalThreats: 0,
        totalAppsScanned: 0,
        totalFilesChecked: 0,
        totalScans: 0,
        riskLevel: "Unknown",
        securityStatus: "No Scan Data",
        insight:
            "Run your first security scan to generate analytics.",
      );
    }

    int totalApps = 0;
    int totalFiles = 0;
    int totalThreats = 0;
    int totalScore = 0;

    for (final scan in history) {
      totalApps += scan.appsScanned;
      totalFiles += scan.filesChecked;
      totalThreats += scan.threatsFound;
      totalScore += scan.protectionScore;
    }

    final averageScore =
        (totalScore / history.length).round();

    String riskLevel;

    if (averageScore >= 90) {
      riskLevel = "LOW";
    } else if (averageScore >= 70) {
      riskLevel = "MEDIUM";
    } else {
      riskLevel = "HIGH";
    }

    String securityStatus;

    if (averageScore >= 90) {
      securityStatus = "Excellent Protection";
    } else if (averageScore >= 70) {
      securityStatus = "Protected";
    } else {
      securityStatus = "Needs Attention";
    }

    String insight;

    if (averageScore >= 90) {
      insight =
          "Your device has maintained excellent security. No significant threats were detected.";
    } else if (averageScore >= 70) {
      insight =
          "Your device is protected, but regular scans are recommended.";
    } else {
      insight =
          "Your device requires immediate security attention.";
    }

    return AnalyticsModel(
      protectionScore: averageScore,
      totalThreats: totalThreats,
      totalAppsScanned: totalApps,
      totalFilesChecked: totalFiles,
      totalScans: history.length,
      riskLevel: riskLevel,
      securityStatus: securityStatus,
      insight: insight,
    );
  }
}