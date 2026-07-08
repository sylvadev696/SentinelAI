// ==========================================================
// SENTINEL AI
// File: activity_screen.dart
//
// Description:
// Displays the complete scan history stored on
// the device using SharedPreferences.
//
// Features:
// • Persistent scan history
// • Automatic loading
// • Loading indicator
// • Enterprise architecture
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

import '../../services/activity_storage_service.dart';
import '../scan/scan_engine.dart';
import '../../services/activity_time_service.dart';
import 'widgets/search_bar_widget.dart';
class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() =>
      _ActivityScreenState();
}

class _ActivityScreenState
    extends State<ActivityScreen> {

  // ==========================================================
  // SCREEN STATE
  // ==========================================================

  bool isLoading = true;

// ==========================================================
// ALL SAVED SCANS
// ==========================================================

List<ScanResult> history = [];

// ==========================================================
// SEARCH CONTROLLER
// ==========================================================

final TextEditingController searchController =
    TextEditingController();


void searchHistory(String value){
  // We implement the search logic in the next phase.
}


// ==========================================================
// FILTERED SCANS
// ==========================================================

List<ScanResult> filteredHistory = [];



  // ==========================================================
  // INITIALIZE SCREEN
  // ==========================================================

  @override
  void initState() {
    super.initState();

    loadHistory();
  }

  // ==========================================================
  // LOAD SAVED SCAN HISTORY
  //
  // Retrieves every stored scan from
  // SharedPreferences.
  // ==========================================================

  Future<void> loadHistory() async {

    final scans =
        await ActivityStorageService.loadScans();

    if (!mounted) return;

    setState(() {
      history = scans;
      filteredHistory = scans;
      isLoading = false;
    });
  }

  // ==========================================================
  // USER INTERFACE
  // ==========================================================

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: const Text("Recent Scans"),
    backgroundColor: const Color(0xFF0B3D91),
    foregroundColor: Colors.white,
  ),
  body: Column(
  children: [

    // ==========================================================
    // SEARCH BAR
    // ==========================================================

    Padding(
      padding: EdgeInsets.all(16),
      child: SearchBarWidget(
        controller: searchController,
        onChanged: searchHistory,
      ),
    ),

    // ==========================================================
    // HISTORY LIST
    // ==========================================================

    Expanded(
      child: isLoading

  

      // ======================================================
      // LOADING STATE
      // ======================================================

      ? const Center(
          child: CircularProgressIndicator(),
        )

      // ======================================================
      // EMPTY HISTORY
      // ======================================================

      : history.isEmpty

          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.history,
                      size: 90,
                      color: Colors.grey,
                    ),

                    SizedBox(height: 20),

                    Text(
                      "No Scan History",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Run your first security scan.\nYour completed scans will appear here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )

          // ======================================================
          // HISTORY LIST
          // ======================================================

          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: history.length,
              itemBuilder: (context, index) {

                final scan = history[index];
// ==========================================================
// FORMATTED ACTIVITY TIME
// ==========================================================

final relativeTime =
    ActivityTimeService.getRelativeTime(
      scan.scanTime,
    );

final fullDate =
    ActivityTimeService.getFullDate(
      scan.scanTime,
    );

final exactTime =
    ActivityTimeService.getTime(
      scan.scanTime,
    );

                Color statusColor;

                IconData statusIcon;

                if (scan.protectionScore >= 90) {
                  statusColor = Colors.green;
                  statusIcon = Icons.verified_user;
                } else if (scan.protectionScore >= 70) {
                  statusColor = Colors.orange;
                  statusIcon = Icons.warning;
                } else {
                  statusColor = Colors.red;
                  statusIcon = Icons.gpp_bad;
                }


                return buildHistoryCard(
                  scan,
                  statusColor,
                  statusIcon,
                  relativeTime,
                  fullDate,
                  exactTime,
                );
              },
            ),
    ),
 ]
  )
  );
         
 }
// ==========================================================
// HISTORY CARD
//
// Displays a professional summary of one completed scan.
//
// Each card contains:
//
// • Security icon
// • Security level
// • Relative scan time
// • Full scan date
// • Exact scan time
// • Protection score
// • Statistics
// • Scan status
// ==========================================================

Widget buildHistoryCard(
  ScanResult scan,
  Color statusColor,
  IconData statusIcon,
  String relativeTime,
  String fullDate,
  String exactTime,
) {
  return Card(
    margin: const EdgeInsets.only(bottom: 16),

    elevation: 4,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),

    child: Padding(
      padding: const EdgeInsets.all(18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          // ==================================================
          // CARD HEADER
          //
          // Contains:
          // • Security icon
          // • Security level
          // • Time information
          // • Protection score
          // ==================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // ==============================================
              // STATUS ICON
              // ==============================================

              CircleAvatar(
                backgroundColor:
                    statusColor.withOpacity(.15),

                child: Icon(
                  statusIcon,
                  color: statusColor,
                ),
              ),

              const SizedBox(width: 14),

              // ==============================================
              // SECURITY LEVEL + TIME INFORMATION
              // ==============================================

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // ==========================================
                    // SECURITY LEVEL
                    // ==========================================

                    Text(
                      scan.securityLevel,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // ==========================================
                    // RELATIVE TIME
                    //
                    // Example:
                    // 🟢 Just now
                    // 🟢 5 minutes ago
                    // 🟠 2 hours ago
                    // 🔵 Yesterday
                    // ⚪ Last week
                    // ==========================================

                    Text(
                      relativeTime,

                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    // ==========================================
                    // FULL DATE
                    //
                    // Example:
                    // 25 June 2026
                    // ==========================================

                    Text(
                      fullDate,

                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 3),

                    // ==========================================
                    // EXACT TIME
                    //
                    // Example:
                    // 08:42 AM
                    // ==========================================

                    Text(
                      exactTime,

                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              // ==============================================
              // PROTECTION SCORE
              // ==============================================

              Text(
                "${scan.protectionScore}%",

                style: TextStyle(
                  color: statusColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Divider(),

          const SizedBox(height: 10),
// ==================================================
          // APPS SCANNED
          // ==================================================

          Row(
            children: [

              const Icon(Icons.apps, size: 20),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  "Apps Scanned",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

              Text(
                "${scan.appsScanned}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ==================================================
          // FILES CHECKED
          // ==================================================

          Row(
            children: [

              const Icon(Icons.folder, size: 20),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  "Files Checked",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

              Text(
                "${scan.filesChecked}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ==================================================
          // THREATS FOUND
          // ==================================================

          Row(
            children: [

              const Icon(
                Icons.warning_amber_rounded,
                size: 20,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  "Threats Found",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

              Text(
                "${scan.threatsFound}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ==================================================
          // SECURITY STATUS
          //
          // Displays the final scan result message.
          // Example:
          // ✓ Device is Secure
          // ⚠ Threats Detected
          // ==================================================

          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: statusColor.withOpacity(.08),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Text(
              scan.status,

              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}