// ==========================================================
// SENTINEL AI
// File: file_information_service.dart
//
// Description:
// Reads metadata from files and converts them into
// FileInformation objects.
//
// Responsibilities:
//
// • Read file name
// • Read file extension
// • Read file size
// • Read last modified date
// • Detect hidden files
// • Detect executable files
//
// Author: Ab Junior
// ==========================================================

import 'dart:io';

import '../models/file_information.dart';

class FileInformationService {

  // ==========================================================
  // CREATE FILE INFORMATION
  // ==========================================================

  static Future<FileInformation> getFileInformation(
    File file,
  ) async {

    final fileName =
        file.uri.pathSegments.last;

    final extension =
        fileName.contains(".")
            ? fileName.split(".").last.toLowerCase()
            : "";

    final fileSize =
        await file.length();

    final modifiedDate =
        await file.lastModified();

    final isHidden =
        fileName.startsWith(".");

    final executableExtensions = [

      "exe",
      "apk",
      "bat",
      "cmd",
      "sh",
      "jar",

    ];

    final isExecutable =
        executableExtensions.contains(
          extension,
        );

    return FileInformation(

      fileName: fileName,

      filePath: file.path,

      extension: extension,

      fileSize: fileSize,

      lastModified: modifiedDate,

      isHidden: isHidden,

      isExecutable: isExecutable,
    );
  }
}