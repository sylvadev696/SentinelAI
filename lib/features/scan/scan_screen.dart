import 'dart:async';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool isScanning = false;
  double progress = 0.35; // Start the progress at 35%
  void startScan() {
  setState(() {
    isScanning = true;
    progress = 0.0;
  });

  Timer.periodic(const Duration(milliseconds: 200), (timer) {
    setState(() {
      progress += 0.05;
    });

    if (progress >= 1.0) {
      timer.cancel();

      setState(() {
        progress = 1.0;
        isScanning = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Scan Complete! No threats detected."),
        ),
      );
    }
  });
}
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
          isScanning ? "Scanning..." : "Ready to Scan",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: isScanning ? null : startScan,
          icon: const Icon(Icons.play_arrow),
          label: const Text("START SCAN"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B3D91),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
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