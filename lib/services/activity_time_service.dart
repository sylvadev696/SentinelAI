// ==========================================================
// SENTINEL AI
// File: activity_time_service.dart
//
// Description:
// Converts DateTime values into enterprise-friendly
// activity timestamps.
//
// This service provides:
// • Relative time (Just now, 5 minutes ago...)
// • Full date (6 July 2026)
// • Time (2:43 PM)
//
// Author: Ab Junior
// ==========================================================

class ActivityTimeService {

  // ==========================================================
  // RELATIVE TIME
  //
  // Converts a DateTime into a human-readable
  // relative timestamp.
  // ==========================================================

  static String getRelativeTime(DateTime dateTime) {

    final now = DateTime.now();

    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return "🟢 Just now";
    }

    if (difference.inMinutes < 60) {
      return "🟢 ${difference.inMinutes} minute${difference.inMinutes == 1 ? "" : "s"} ago";
    }

    if (difference.inHours < 24) {
      return "🟠 ${difference.inHours} hour${difference.inHours == 1 ? "" : "s"} ago";
    }

    if (difference.inDays == 1) {
      return "🔵 Yesterday";
    }

    if (difference.inDays < 7) {
      return "🔵 ${difference.inDays} days ago";
    }

    if (difference.inDays < 30) {
      return "⚪ ${(difference.inDays / 7).floor()} week${(difference.inDays / 7).floor() == 1 ? "" : "s"} ago";
    }

    if (difference.inDays < 365) {
      return "⚪ ${_monthName(dateTime.month)} ${dateTime.year}";
    }

    return "⚫ ${dateTime.day} ${_monthName(dateTime.month)} ${dateTime.year}";
  }

  // ==========================================================
  // FULL DATE
  //
  // Example:
  // 6 July 2026
  // ==========================================================

  static String getFullDate(DateTime dateTime) {

    return "${dateTime.day} ${_monthName(dateTime.month)} ${dateTime.year}";
  }

  // ==========================================================
  // TIME
  //
  // Example:
  // 2:43 PM
  // ==========================================================

  static String getTime(DateTime dateTime) {

    int hour = dateTime.hour;

    final minute =
        dateTime.minute.toString().padLeft(2, '0');

    final period = hour >= 12 ? "PM" : "AM";

    hour = hour % 12;

    if (hour == 0) {
      hour = 12;
    }

    return "$hour:$minute $period";
  }

  // ==========================================================
  // MONTH NAME
  // ==========================================================

  static String _monthName(int month) {

    const months = [

      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    return months[month - 1];
  }
}