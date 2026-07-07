// ==========================================================
// SENTINEL AI
// File: activity_storage_service.dart
//
// Description:
// Handles permanent storage of scan activity history
// using SharedPreferences.
//
// This service is responsible for:
// • Saving completed scans
// • Loading saved scans
// • Clearing activity history
//
// Author: Ab Junior
// ==========================================================

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../features/scan/scan_engine.dart';

class ActivityStorageService {

  // ==========================================================
  // STORAGE KEY
  // ==========================================================

  static const String _historyKey = "activity_history";

  // ==========================================================
  // SAVE SCAN
  //
  // Adds a newly completed scan to the stored history.
  // ==========================================================

  static Future<void> saveScan(
    ScanResult scan,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    final history =
        prefs.getStringList(_historyKey) ?? [];

    history.insert(
      0,
      jsonEncode(scan.toMap()),
    );

    await prefs.setStringList(
      _historyKey,
      history,
    );
  }

  // ==========================================================
  // LOAD SCANS
  //
  // Returns all saved scans.
  // ==========================================================

  static Future<List<ScanResult>> loadScans() async {

    final prefs = await SharedPreferences.getInstance();

    final history =
        prefs.getStringList(_historyKey) ?? [];

    return history
        .map(
          (item) => ScanResult.fromMap(
            Map<String, dynamic>.from(
              jsonDecode(item),
            ),
          ),
        )
        .toList();
  }

  // ==========================================================
  // CLEAR HISTORY
  //
  // Removes every stored scan.
  // ==========================================================

  static Future<void> clearHistory() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_historyKey);
  }
}