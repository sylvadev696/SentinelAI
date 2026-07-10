// ==========================================================
// SENTINEL AI
// File: widget_test.dart
//
// Description:
// Placeholder widget test.
//
// We are not writing automated widget tests yet,
// so this file simply verifies that SentinelApp
// can be created successfully.
//
// Author: Ab Junior
// ==========================================================

import 'package:flutter_test/flutter_test.dart';
import 'package:sentinel_ai/app.dart';

void main() {
  testWidgets(
    'SentinelApp builds successfully',
    (WidgetTester tester) async {
      // Build the root widget.
      await tester.pumpWidget(
        const SentinelApp(),
      );

      // Allow Flutter to finish the first frame.
      await tester.pump();

      // If no exception is thrown,
      // the test passes.
      expect(tester.takeException(), isNull);
    },
  );
}