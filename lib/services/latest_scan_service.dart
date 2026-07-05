// ==========================================================
// SENTINEL AI
// File: latest_scan_service.dart
//
// Description:
// Stores the latest completed scan so multiple screens
// can access the same information.
//
// Author: Ab Junior
// ==========================================================

import '../features/scan/scan_engine.dart';

class LatestScanService {

  static ScanResult? latestScan;

  static final List<ScanResult> scanHistory = [];

  static void saveScan(ScanResult result) {
    latestScan = result;
    scanHistory.insert(0, result); // newest first
  }

  static ScanResult? getLatestScan() {
    return latestScan;
  }

  static List<ScanResult> getHistory() {
    return scanHistory;
  }
}