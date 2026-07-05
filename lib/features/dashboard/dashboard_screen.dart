// ==========================================================
// SENTINEL AI
// File: dashboard_screen.dart
//
// Description:
// Displays the Sentinel AI dashboard and dynamically
// shows the latest scan information.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

import '../../services/latest_scan_service.dart';
import '../scan/scan_engine.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // ==========================================================
  // DYNAMIC GREETING
  // ==========================================================

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Your device is secure and ready for the day.";
    } else if (hour < 17) {
      return "No threats detected during today's activity.";
    } else {
      return "Your device remained protected throughout the day.";
    }
  }

  @override
  Widget build(BuildContext context) {
    // ==========================================================
    // GET THE MOST RECENT SCAN
    // ==========================================================

    final ScanResult? latestScan =
        LatestScanService.getLatestScan();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text("Sentinel AI"),
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ==================================================
            // GREETING
            // ==================================================

            Text(
              "${getGreeting()} 👋",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              getGreetingMessage(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // PROTECTION CARD
            // ==================================================

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(
                      children: [

                        CircleAvatar(
                          backgroundColor:
                              latestScan == null
                                  ? Colors.grey
                                  : latestScan.protectionScore >= 90
                                      ? Colors.green
                                      : latestScan.protectionScore >= 70
                                          ? Colors.orange
                                          : Colors.red,

                          child: const Icon(
                            Icons.verified_user,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 15),

                        const Text(
                          "Protection Status",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      latestScan == null
                          ? "No Scan Yet"
                          : latestScan.securityLevel,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      latestScan == null
                          ? "Run your first security scan."
                          : latestScan.recommendation,
                    ),

                    if (latestScan != null) ...[
                      const SizedBox(height: 15),

                      Text(
                        "Protection Score: ${latestScan.protectionScore}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==================================================
            // QUICK ACTIONS
            // ==================================================

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.2,

              children: [

                _actionCard(
                  Icons.security,
                  "Scan Device",
                  Colors.blue,
                ),

                _actionCard(
                  Icons.folder,
                  "File Scanner",
                  Colors.orange,
                ),

                _actionCard(
                  Icons.wifi,
                  "Network Monitor",
                  Colors.green,
                ),

                _actionCard(
                  Icons.settings,
                  "Settings",
                  Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==================================================
            // RECENT ACTIVITY
            // ==================================================

            const Text(
              "Recent Activity",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ListTile(
              leading: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: const Text("Files Checked"),
              subtitle: Text(
                latestScan == null
                    ? "No scan performed"
                    : latestScan.filesChecked.toString(),
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.security,
                color: Colors.blue,
              ),
              title: const Text("Threats Found"),
              subtitle: Text(
                latestScan == null
                    ? "No scan performed"
                    : latestScan.threatsFound.toString(),
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.shield,
                color: Colors.green,
              ),
              title: const Text("Security Level"),
              subtitle: Text(
                latestScan == null
                    ? "Unknown"
                    : latestScan.securityLevel,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // QUICK ACTION CARD
  // ==========================================================

  Widget _actionCard(
    IconData icon,
    String title,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(16),

        onTap: () {},

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 40,
              color: color,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}