// ==========================================================
// SENTINEL AI
// File: file_scanner.dart
//
// Description:
// Scans a directory and collects information
// about every file found.
//
// Features:
//
// • Recursive scanning
// • Defensive exception handling
// • Hidden file detection
// • File metadata collection
//
// Author: Ab Junior
// ==========================================================

import 'dart:io';

import '../models/file_information.dart';
import '../services/file_information_service.dart';

class FileScanner {

  // ==========================================================
  // SCAN DIRECTORY
  // ==========================================================

  static Future<List<FileInformation>> scanDirectory(
    Directory directory,
  ) async {

    final List<FileInformation> files = [];

    // Directory doesn't exist
    if (!await directory.exists()) {
      return files;
    }

    try {

      await for (final entity
          in directory.list(
            recursive: true,
            followLinks: false,
          )) {

        if (entity is File) {

          try {

            final info =
                await FileInformationService
                    .getFileInformation(entity);

            files.add(info);

          }

          // ==================================================
          // DEFENSIVE CODING
          //
          // Never stop the scan because of one bad file.
          // ==================================================

          catch (_) {
            continue;
          }
        }
      }

    } catch (_) {}

    return files;
  }
}