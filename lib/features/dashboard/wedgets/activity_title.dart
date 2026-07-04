import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withValues(alpha: 0.15),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}