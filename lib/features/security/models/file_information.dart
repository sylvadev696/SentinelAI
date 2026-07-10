// ==========================================================
// SENTINEL AI
// File: file_information.dart
//
// Description:
// Represents a single file discovered during a
// security scan.
//
// This model is the foundation of the Security Engine.
//
// Future modules:
//
// • Hash Generator
// • Malware Signature Engine
// • AI Threat Analysis
// • Risk Calculator
// • Scan Reports
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/foundation.dart';

@immutable
class FileInformation {

  // ==========================================================
  // BASIC FILE DETAILS
  // ==========================================================

  final String fileName;

  final String filePath;

  final String extension;

  // ==========================================================
  // FILE METADATA
  // ==========================================================

  final int fileSize;

  final DateTime lastModified;

  // ==========================================================
  // SECURITY FLAGS
  // ==========================================================

  final bool isHidden;

  final bool isExecutable;

  // ==========================================================
  // CONSTRUCTOR
  // ==========================================================

  const FileInformation({

    required this.fileName,

    required this.filePath,

    required this.extension,

    required this.fileSize,

    required this.lastModified,

    required this.isHidden,

    required this.isExecutable,
  });

  // ==========================================================
  // CONVERT TO MAP
  // ==========================================================

  Map<String, dynamic> toMap() {

    return {

      "fileName": fileName,

      "filePath": filePath,

      "extension": extension,

      "fileSize": fileSize,

      "lastModified": lastModified.toIso8601String(),

      "isHidden": isHidden,

      "isExecutable": isExecutable,
    };
  }

  // ==========================================================
  // CREATE FROM MAP
  // ==========================================================

  factory FileInformation.fromMap(
    Map<String, dynamic> map,
  ) {

    return FileInformation(

      fileName: map["fileName"],

      filePath: map["filePath"],

      extension: map["extension"],

      fileSize: map["fileSize"],

      lastModified: DateTime.parse(
        map["lastModified"],
      ),

      isHidden: map["isHidden"],

      isExecutable: map["isExecutable"],
    );
  }
}