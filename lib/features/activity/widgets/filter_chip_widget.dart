// ==========================================================
// SENTINEL AI
// File: filter_chip_widget.dart
//
// Description:
// Reusable filter chip used to filter
// Activity History.
//
// Filters:
// • All
// • Safe
// • Warning
// • Critical
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),

      child: ChoiceChip(
        label: Text(label),

        selected: selected,

        onSelected: (_) => onTap(),

        selectedColor: const Color(0xFF0B3D91),

        labelStyle: TextStyle(
          color:
              selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}