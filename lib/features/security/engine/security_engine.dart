// ==========================================================
// SENTINEL AI
// File: security_engine.dart
//
// Description:
// Central coordinator of Sentinel AI's Security Engine.
//
// Responsibilities:
//
// • Start scans
// • Coordinate scanners
// • Collect scan results
// • Prepare data for future AI analysis
//
// Author: Ab Junior
// ==========================================================

import 'dart:io';

import '../models/file_information.dart';
import '../scanners/file_scanner.dart';
import '../services/permission_service.dart';

class SecurityEngine {

  // ==========================================================
  // SCAN DIRECTORY
  //
  // Executes the complete file scanning pipeline.
  // ==========================================================

  static Future<List<FileInformation>> scanDirectory(
  Directory directory,
) async {

  final hasPermission =
      await PermissionService.requestStoragePermission();

  if (!hasPermission) {
    throw Exception("Storage permission denied.");
  }

  final files =
      await FileScanner.scanDirectory(
    directory,
  );

  return files;
}
}