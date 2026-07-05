// ==========================================================
// SENTINEL AI
// File: scan_screen.dart
//
// Description:
// Displays the device scanner screen, performs a simulated
// security scan, and presents a dynamic security report.
//
// Author: Ab Junior
// ==========================================================

import 'dart:async';
import 'package:flutter/material.dart';

import 'scan_engine.dart';
import 'widgets/scan_report_card.dart';
import '../../services/latest_scan_service.dart';  

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  // ==========================================================
  // SCAN STATE VARIABLES
  // ==========================================================

  bool isScanning = false;
  double progress = 0.0;

  // Stores the latest completed scan
  ScanResult? scanResult;

  // ==========================================================
  // START DEVICE SCAN
  // ==========================================================

  void startScan() {
    setState(() {
      isScanning = true;
      progress = 0.0;
      scanResult = null;
    });

    Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        setState(() {
          progress += 0.05;
        });

        if (progress >= 1.0) {
          timer.cancel();

          final result = ScanEngine.performScan();

          setState(() {
            progress = 1.0;
            isScanning = false;
            scanResult = result;
          });
          //save the latest scan result to the service
          LatestScanService.saveScan(result);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result.status),
            ),
          );
        }
      },
    );
  }

  // ==========================================================
  // USER INTERFACE
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Scanner"),
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Shield Icon
              const Icon(
                Icons.shield_rounded,
                size: 100,
                color: Color(0xFF0B3D91),
              ),

              const SizedBox(height: 30),

              // Scan Title
              Text(
                isScanning ? "Scanning..." : "Ready to Scan",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // ==================================================
              // PROGRESS BAR
              // ==================================================

              if (isScanning) ...[
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                ),

                const SizedBox(height: 10),

                Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),
              ],

              // ==================================================
              // START SCAN BUTTON
              // ==================================================

              ElevatedButton.icon(
                onPressed: isScanning ? null : startScan,

                icon: const Icon(Icons.play_arrow),

                label: Text(
                  isScanning
                      ? "SCANNING..."
                      : "START SCAN",
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B3D91),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ==================================================
              // SCAN REPORT
              // ==================================================

              if (scanResult != null)
                ScanReportCard(
                  scanResult: scanResult!,
                ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}