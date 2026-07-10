// ==========================================================
// SENTINEL AI
// File: permission_service.dart
//
// Description:
// Handles all storage permissions required by
// the Security Engine.
//
// Responsibilities:
//
// • Check storage permission
// • Request storage permission
// • Return permission status
//
// Future:
//
// • Manage Photos permission
// • Manage Notification permission
// • Manage Camera permission
// • Manage Microphone permission
//
// Author: Ab Junior
// ==========================================================

import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  // ==========================================================
  // STORAGE PERMISSION
  // ==========================================================

  static Future<bool> requestStoragePermission() async {

    final status =
        await Permission.storage.request();

    return status.isGranted;
  }

  // ==========================================================
  // CHECK STORAGE PERMISSION
  // ==========================================================

  static Future<bool> hasStoragePermission() async {

    return await Permission.storage.isGranted;
  }

}