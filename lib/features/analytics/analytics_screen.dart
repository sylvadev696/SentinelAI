// ==========================================================
// SENTINEL AI
// File: analytics_screen.dart
//
// Description:
// Enterprise Security Analytics Dashboard.
//
// Uses FutureBuilder to load analytics from
// ActivityStorageService.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

import 'analytics_model.dart';
import 'analytics_service.dart';
import 'widgets/metric_card.dart';
import 'widgets/security_overview_card.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() =>
      _AnalyticsScreenState();
}

class _AnalyticsScreenState
    extends State<AnalyticsScreen> {

  // ==========================================================
  // LOAD ANALYTICS
  // ==========================================================

  late Future<AnalyticsModel> analyticsFuture;

  @override
  void initState() {
    super.initState();

    analyticsFuture =
        AnalyticsService.generateAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Security Center"),
        backgroundColor: const Color(0xFF0B3D91),
        foregroundColor: Colors.white,
      ),

      body: FutureBuilder<AnalyticsModel>(

        future: analyticsFuture,

        builder: (context, snapshot) {

          // Loading
          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (snapshot.hasError) {

            return Center(
              child: Text(
                "Error:\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          final analytics = snapshot.data!;

          return SingleChildScrollView(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const Text(
                  "Real-time Protection Overview",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                SecurityOverviewCard(
                  score: analytics.protectionScore.toDouble(),
                  status: analytics.securityStatus,
                  lastScan: "Latest saved scan",
                ),

                const SizedBox(height: 30),

                const Text(
                  "Quick Statistics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                GridView.count(

                  crossAxisCount: 2,

                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  crossAxisSpacing: 15,

                  mainAxisSpacing: 15,

                  childAspectRatio: .88,

                  children: [MetricCard(
                      icon: Icons.warning_amber_rounded,
                      title: "Threats",
                      value:
                          analytics.totalThreats.toString(),
                      color: Colors.red,
                    ),

                    MetricCard(
                      icon: Icons.apps,
                      title: "Applications",
                      value: analytics
                          .totalAppsScanned
                          .toString(),
                      color: Colors.blue,
                    ),

                    MetricCard(
                      icon: Icons.folder_copy,
                      title: "Files",
                      value: analytics
                          .totalFilesChecked
                          .toString(),
                      color: Colors.orange,
                    ),

                    MetricCard(
                      icon: Icons.verified_user,
                      title: "Risk",
                      value: analytics.riskLevel,
                      color: Colors.green,
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                const Text(
                  "Security Recommendation",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(22),
                  ),

                  child: Padding(
                    padding:
                        const EdgeInsets.all(22),

                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        const CircleAvatar(
                          radius: 24,
                          backgroundColor:
                              Color(0xFFE8F5E9),

                          child: Icon(
                            Icons.verified,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(width: 18),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              const Text(
                                "AI Recommendation",
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              Text(
                                analytics.insight,
                                style:
                                    const TextStyle(
                                  height: 1.5,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              const Text(
                                "Generated from your saved scan history",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                ],
            ),
          );
        },
      ),
    );
  }
}