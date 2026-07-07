// ==========================================================
// SENTINEL AI
// File: analytics_model.dart
//
// Description:
// Stores all analytics information displayed on the
// Enterprise Security Analytics dashboard.
//
// Author: Ab Junior
// ==========================================================

class AnalyticsModel {

  // ==========================================================
  // SECURITY METRICS
  // ==========================================================

  final int protectionScore;
  final int totalThreats;
  final int totalAppsScanned;
  final int totalFilesChecked;
  final int totalScans;

  // ==========================================================
  // SECURITY STATUS
  // ==========================================================

  final String riskLevel;
  final String securityStatus;
  final String insight;

  // ==========================================================
  // CONSTRUCTOR
  // ==========================================================

  const AnalyticsModel({
    required this.protectionScore,
    required this.totalThreats,
    required this.totalAppsScanned,
    required this.totalFilesChecked,
    required this.totalScans,
    required this.riskLevel,
    required this.securityStatus,
    required this.insight,
  });
}