// ==========================================================
// SENTINEL AI
// File: search_bar_widget.dart
//
// Description:
// Enterprise Search Bar for filtering Activity History.
//
// Features:
// • Rounded search field
// • Search icon
// • Clean enterprise styling
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: "Search activity...",

        prefixIcon: const Icon(Icons.search),

        filled: true,
        fillColor: Colors.grey.shade100,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
    );
  }
}