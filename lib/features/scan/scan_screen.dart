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

  // Stores the latest completed scan.
  ScanResult? scanResult;

  // ==========================================================
  // START DEVICE SCAN
  //
  // Simulates a real antivirus scan using a timer.
  // Updates the progress bar and generates a
  // dynamic security report when finished.
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

      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.shield_rounded,
                size: 100,
                color: Color(0xFF0B3D91),
              ),

              const SizedBox(height: 30),

              Text(

                isScanning
                    ? "Scanning..."
                    : "Ready to Scan",

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

                onPressed:
                    isScanning
                        ? null
                        : startScan,

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

                Card(

                  elevation: 4,

                  child: Padding(

                    padding: const EdgeInsets.all(16),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const Text(

                          "📋 Scan Report",

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "📱 Apps Scanned: ${scanResult!.appsScanned}",
                        ),

                        Text(
                          "📂 Files Checked: ${scanResult!.filesChecked}",
                        ),

                        Text(
                          "⚠️ Threats Found: ${scanResult!.threatsFound}",
                        ),

                        const SizedBox(height: 8),

                        Text(

                          "🛡 Protection Score: ${scanResult!.protectionScore}%",

                          style: TextStyle(

                            fontSize: 18,

                            fontWeight: FontWeight.bold,

                            color:
                                scanResult!.protectionScore >= 90
                                    ? Colors.green
                                    : scanResult!.protectionScore >= 70
                                        ? Colors.orange
                                        : Colors.red,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(

                          scanResult!.status,

                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}