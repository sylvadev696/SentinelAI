// ==========================================================
// SENTINEL AI
// File: hash_engine.dart
//
// Description:
// Generates cryptographic hashes for files.
//
// Current:
// • SHA-256
//
// Future:
// • SHA-1
// • MD5
//
// Author: Ab Junior
// ==========================================================

import 'dart:io';
import 'package:crypto/crypto.dart';

class HashEngine {

  // ==========================================================
  // GENERATE SHA-256
  // ==========================================================

  static Future<String> generateSHA256(
    File file,
  ) async {

    final bytes = await file.readAsBytes();

    return sha256.convert(bytes).toString();
  }
}