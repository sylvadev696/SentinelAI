import 'package:flutter/material.dart';
import 'package:sentinel_ai/features/auth/login_screen.dart';

class SentinelApp extends StatelessWidget {
  const SentinelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sentinel AI',
      home: const LoginScreen(),
    );
  }
}