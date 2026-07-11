// ==========================================================
// SENTINEL AI
// File: permission_service.dart
//
// Handles storage permissions for Android.
//
// Author: Ab Junior
// ==========================================================

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  // ==========================================================
  // REQUEST STORAGE PERMISSION
  // ==========================================================

  static Future<bool> requestStoragePermission() async {

    if (Platform.isAndroid) {

      // Android 11+
      if (await Permission.manageExternalStorage.isGranted) {
        return true;
      }

      final status =
          await Permission.manageExternalStorage.request();

      return status.isGranted;
    }

    return false;
  }

  // ==========================================================
  // CHECK STORAGE PERMISSION
  // ==========================================================

  static Future<bool> hasStoragePermission() async {

    if (Platform.isAndroid) {
      return await Permission.manageExternalStorage.isGranted;
    }

    return false;
  }

}