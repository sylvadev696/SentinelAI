import 'package:flutter/material.dart';

enum SecurityStatus {
  protected,
  warning,
  danger,
}

class StatusCard extends StatelessWidget {
  final SecurityStatus status;
  final String message;

  const StatusCard({
    super.key,
    required this.status,
    required this.message,
  });

  Color get statusColor {
    switch (status) {
      case SecurityStatus.protected:
        return Colors.green;
      case SecurityStatus.warning:
        return Colors.orange;
      case SecurityStatus.danger:
        return Colors.red;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case SecurityStatus.protected:
        return Icons.verified_user;
      case SecurityStatus.warning:
        return Icons.warning_amber_rounded;
      case SecurityStatus.danger:
        return Icons.gpp_bad;
    }
  }

  String get statusTitle {
    switch (status) {
      case SecurityStatus.protected:
        return "Protected";
      case SecurityStatus.warning:
        return "Warning";
      case SecurityStatus.danger:
        return "Threat Detected";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: statusColor,
              child: Icon(
                statusIcon,
                color: Colors.white,
                size: 34,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    statusTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}