// ==========================================================
// SENTINEL AI
// File: latest_scan_service.dart
//
// Description:
// Stores only the most recent completed scan.
//
// Permanent scan history is handled by
// ActivityStorageService.
//
// Author: Ab Junior
// ==========================================================

import '../features/scan/scan_engine.dart';

class LatestScanService {

  // ==========================================================
  // LATEST SCAN
  // ==========================================================

  static ScanResult? _latestScan;

  // ==========================================================
  // SAVE LATEST SCAN
  // ==========================================================

  static void saveScan(
    ScanResult result,
  ) {
    _latestScan = result;
  }

  // ==========================================================
  // GET LATEST SCAN
  // ==========================================================

  static ScanResult? getLatestScan() {
    return _latestScan;
  }
}